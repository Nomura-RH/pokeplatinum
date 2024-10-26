#ifndef POKEPLATINUM_OV21_021DC9BC_H
#define POKEPLATINUM_OV21_021DC9BC_H

#include "overlay021/struct_ov21_021D0F60_decl.h"
#include "overlay021/struct_ov21_021E68F4.h"

#define TERMINALVALUE      0xffff
#define POKEDEXMAPXSCALE   5
#define POKEDEXMAPYSCALE   5
#define POKEDEXMAPHEIGHT   30
#define POKEDEXMAPWIDTH    30
#define POKEDEXMAPNUMCELLS (POKEDEXMAPHEIGHT * POKEDEXMAPWIDTH)
#define NUMDUNGEONS        22

void ov21_021DC9BC(UnkStruct_ov21_021E68F4 *param0, UnkStruct_ov21_021D0F60 *param1, int heapID);
void ov21_021DCA14(UnkStruct_ov21_021E68F4 *param0);
int ov21_021DCA28(const UnkStruct_ov21_021E68F4 *param0);
void ov21_021DCA30(UnkStruct_ov21_021E68F4 *param0, int param1);
void ov21_021DCA44(UnkStruct_ov21_021E68F4 *param0, int param1, int param2);
void ov21_021DCA4C(UnkStruct_ov21_021E68F4 *param0, int param1);
void ov21_021DCA54(UnkStruct_ov21_021E68F4 *param0, int param1);

#endif // POKEPLATINUM_OV21_021DC9BC_H
