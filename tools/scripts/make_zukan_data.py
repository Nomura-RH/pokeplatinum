#!/usr/bin/env python3
import argparse
import json
import pathlib
import subprocess

from consts.species import PokemonSpecies
from consts.pokemon import PokemonBodyShape


argparser = argparse.ArgumentParser(
    prog='make_zukan_data_py',
    description='Packs the archive containing Pokedex sorting'
)
argparser.add_argument('-k', '--knarc',
                       required=True,
                       help='Path to knarc executable')
argparser.add_argument('-s', '--source-dir',
                       required=True,
                       help='Path to the source directory (res/pokemon)')
argparser.add_argument('-p', '--private-dir',
                       required=True,
                       help='Path to the private directory (where binaries will be made)')
argparser.add_argument('-o', '--output-dir',
                       required=True,
                       help='Path to the output directory (where the NARC will be made)')
argparser.add_argument('pokedex',
                       help='List of pokemon in the Sinnoh Pokedex')
args = argparser.parse_args()

source_dir = pathlib.Path(args.source_dir)
private_dir = pathlib.Path(args.private_dir)
output_dir = pathlib.Path(args.output_dir)

private_dir.mkdir(parents=True, exist_ok=True)

pokemon_types = [
    'TYPE_NORMAL',
    'TYPE_FIGHTING',
    'TYPE_FLYING',
    'TYPE_POISON',
    'TYPE_GROUND',
    'TYPE_ROCK',
    'TYPE_BUG',
    'TYPE_GHOST',
    'TYPE_STEEL',
    'TYPE_FIRE',
    'TYPE_WATER',
    'TYPE_GRASS',
    'TYPE_ELECTRIC',
    'TYPE_PSYCHIC',
    'TYPE_ICE',
    'TYPE_DRAGON',
    'TYPE_DARK',
]

data_names = [
    'height',
    'weight',
    'body_shape',
    'trainer_scale_f',
    'pokemon_scale_f',
    'trainer_scale_m',
    'pokemon_scale_m',
    'trainer_pos_f',
    'pokemon_pos_f',
    'trainer_pos_m',
    'pokemon_pos_m'
]

def DataSize(num):
    if num < 2:
        return 4
    if num == 2:
        return 1
    return 2

binData = [bytes() for f in range(58)]
heightData = [0 for i in range(len(PokemonSpecies)-3)]
weightData = [0 for i in range(len(PokemonSpecies)-3)]
nameData = ['' for i in range(len(PokemonSpecies)-3)]
for i, species in enumerate(PokemonSpecies):
    subdir = species.name
    subdir = subdir[8:].lower()
    if subdir == 'none':
        subdir = '000'
    # Do not attempt to process eggs
    if subdir in ['egg', 'bad_egg']:
        continue
    
    with open(source_dir / '../../../../pokemon' / subdir / 'data.json', 'r') as data_file:
        pkdata = json.load(data_file)
    
    for j in range(11):
        dataSize = DataSize(j)
        if j == 2:
            binData[2] = binData[2] + PokemonBodyShape[pkdata['body_shape']].value.to_bytes(1, 'little')
        else:
            binData[j] = binData[j] + pkdata[data_names[j]].to_bytes(dataSize, 'little')

    if i > 0:
        # national dex order
        binData[11] = binData[11] + i.to_bytes(2, 'little')

        # body shape
        body_idx = PokemonBodyShape[pkdata['body_shape']].value + 44
        binData[body_idx] = binData[body_idx] + i.to_bytes(2, 'little')

        # pokemon types
        for j in range(len(pokemon_types)):
            if pokemon_types[j] in pkdata['types']:
                binData[j+27] = binData[j+27] + i.to_bytes(2, 'little')
        
        # store for later
        heightData[i-1] = pkdata['height']
        weightData[i-1] = pkdata['weight']
        nameData[i-1] = subdir.replace('porygon2','porygon_z2')

# sinnoh dex order
pokedex = [0 for i in range(len(PokemonSpecies)-2)]
with open(args.pokedex) as data_file:
    dex_data = json.load(data_file)
    for mon in dex_data:
        if mon not in ['SPECIES_EGG', 'SPECIES_BAD_EGG', 'SPECIES_NONE', 'SPECIES_ARCEUS']:
            binData[12] = binData[12] + PokemonSpecies[mon].value.to_bytes(2, 'little')

# alphabetical order
alpha = sorted(range(len(nameData)), key=lambda k: nameData[k])
for idx in alpha:
    # alphabetical
    binData[13] = binData[13] + (idx+1).to_bytes(2, 'little')

    # first letter
    letter = ord(nameData[idx][0])
    if letter > 96 and letter < 123:
        letterIDX = int((letter - 1) / 3) - 14
        binData[letterIDX] = binData[letterIDX] + (idx+1).to_bytes(2, 'little')

# heaviest to lightest
heaviest = sorted(range(len(weightData)), key=lambda k: 1/weightData[k])
for idx in heaviest:
    binData[14] = binData[14] + (idx+1).to_bytes(2, 'little')

# lightest to heaviest
lightest = sorted(range(len(weightData)), key=lambda k: weightData[k])
for idx in lightest:
    binData[15] = binData[15] + (idx+1).to_bytes(2, 'little')

# tallest to shortest
tallest = sorted(range(len(weightData)), key=lambda k: 1/heightData[k])
for idx in tallest:
    binData[16] = binData[16] + (idx+1).to_bytes(2, 'little')

# shortest to tallest
shortest = sorted(range(len(weightData)), key=lambda k: heightData[k])
for idx in shortest:
    binData[17] = binData[17] + (idx+1).to_bytes(2, 'little')

# save data
for i in range(58):
    target_fname = private_dir / f'zukan_data_{i:02}.bin'
    with open(target_fname, 'wb+') as target_file:
        target_file.write(binData[i])

subprocess.run([args.knarc, '-d', private_dir, '-p', output_dir / 'zukan_data.narc'])
