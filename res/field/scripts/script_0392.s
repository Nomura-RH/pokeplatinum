    .include "macros/scrcmd.inc"

    .data

    .long _0026-.-4
    .long _003D-.-4
    .long _012D-.-4
    .long _0148-.-4
    .long _0163-.-4
    .long _017E-.-4
    .long _0199-.-4
    .long _01B4-.-4
    .long _01CF-.-4
    .short 0xFD13

_0026:
    ScrCmd_011 0x4069, 0x118
    ScrCmd_01C 0, _0035
    ScrCmd_002

_0035:
    ScrCmd_028 0x4069, 0
    ScrCmd_002

_003D:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_011 0x4069, 0x122
    ScrCmd_01C 1, _00ED
    ScrCmd_011 0x4069, 0x118
    ScrCmd_01C 1, _00F8
    ScrCmd_020 0x964
    ScrCmd_01C 0, _010F
    ScrCmd_32B 0x800C
    ScrCmd_011 0x800C, 0
    ScrCmd_01C 1, _011A
    ScrCmd_011 0x4069, 0x10E
    ScrCmd_01C 1, _00AE
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 0, _011A
    ScrCmd_04B 0x5DC
    ScrCmd_29F 1
    ScrCmd_028 0x4069, 0x10E
    ScrCmd_02C 1
    ScrCmd_016 _0125
    ScrCmd_002

_00AE:
    ScrCmd_04C 0x17B, 0
    ScrCmd_02C 2
    ScrCmd_04D
    ScrCmd_034
    ScrCmd_2BD 0x17B, 30
    ScrCmd_0EC 0x800C
    ScrCmd_011 0x800C, 0
    ScrCmd_01C 1, _0109
    ScrCmd_2BC 0x800C
    ScrCmd_011 0x800C, 1
    ScrCmd_01C 1, _00F8
    ScrCmd_028 0x4069, 0x122
    ScrCmd_061
    ScrCmd_002

_00ED:
    ScrCmd_02C 3
    ScrCmd_016 _0125
    ScrCmd_002

_00F8:
    ScrCmd_028 0x4069, 0x118
    ScrCmd_02C 3
    ScrCmd_016 _0125
    ScrCmd_002

_0109:
    ScrCmd_0EB
    ScrCmd_061
    ScrCmd_002

_010F:
    ScrCmd_02C 4
    ScrCmd_016 _0125
    ScrCmd_002

_011A:
    ScrCmd_02C 0
    ScrCmd_016 _0125
    ScrCmd_002

_0125:
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_012D:
    ScrCmd_028 0x4001, 1
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 4, _020D
    ScrCmd_016 _01EA
    ScrCmd_002

_0148:
    ScrCmd_028 0x4002, 1
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 4, _020D
    ScrCmd_016 _01EA
    ScrCmd_002

_0163:
    ScrCmd_028 0x4003, 1
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 4, _020D
    ScrCmd_016 _01EA
    ScrCmd_002

_017E:
    ScrCmd_028 0x4004, 1
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 4, _020D
    ScrCmd_016 _01EA
    ScrCmd_002

_0199:
    ScrCmd_028 0x4005, 1
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 4, _020D
    ScrCmd_016 _01EA
    ScrCmd_002

_01B4:
    ScrCmd_028 0x4006, 1
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 4, _020D
    ScrCmd_016 _01EA
    ScrCmd_002

_01CF:
    ScrCmd_028 0x4007, 1
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 4, _020D
    ScrCmd_016 _01EA
    ScrCmd_002

_01EA:
    ScrCmd_060
    ScrCmd_069 0x8004, 0x8005
    ScrCmd_32C 0x4069, 0x24C, 0x8004, 0x8005
    ScrCmd_011 0x4069, 0x104
    ScrCmd_01C 4, _020F
    ScrCmd_061
    ScrCmd_002

_020D:
    ScrCmd_002

_020F:
    ScrCmd_020 0x964
    ScrCmd_01C 0, _020D
    ScrCmd_04B 0x5DC
    ScrCmd_29F 1
    ScrCmd_028 0x4069, 0x10E
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

    .byte 0
