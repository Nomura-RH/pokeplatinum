    .include "macros/scrcmd.inc"

    .data

    .long _0022-.-4
    .long _00F2-.-4
    .long _0105-.-4
    .long _0118-.-4
    .long _012B-.-4
    .long _0198-.-4
    .long _01AE-.-4
    .long _01C4-.-4
    .short 0xFD13

_0022:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_27E 0x800C
    ScrCmd_011 0x800C, 1
    ScrCmd_01C 1, _0063
    ScrCmd_02C 0
    ScrCmd_040 1, 1, 0, 1, 0x800C
    ScrCmd_042 229, 1
    ScrCmd_042 228, 0
    ScrCmd_043
    ScrCmd_011 0x800C, 1
    ScrCmd_01C 1, _00C6
    ScrCmd_016 _00BB

_0063:
    ScrCmd_0CD 0
    ScrCmd_02C 1
    ScrCmd_040 1, 1, 0, 1, 0x800C
    ScrCmd_042 229, 0
    ScrCmd_042 228, 1
    ScrCmd_043
    ScrCmd_011 0x800C, 0
    ScrCmd_01C 5, _00BB
    ScrCmd_1B7 0x800C, 4
    ScrCmd_011 0x800C, 0
    ScrCmd_01C 1, _00C6
    ScrCmd_011 0x800C, 1
    ScrCmd_01C 1, _00D1
    ScrCmd_011 0x800C, 2
    ScrCmd_01C 1, _00DC
    ScrCmd_016 _00E7

_00BB:
    ScrCmd_02C 2
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_00C6:
    ScrCmd_02C 3
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_00D1:
    ScrCmd_02C 4
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_00DC:
    ScrCmd_02C 5
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_00E7:
    ScrCmd_02C 6
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_00F2:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 7
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_0105:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 8
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_0118:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 9
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_012B:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_134 10, 0x800C
    ScrCmd_011 0x800C, 1
    ScrCmd_01C 1, _016F
    ScrCmd_02C 10
    ScrCmd_03E 0x800C
    ScrCmd_011 0x800C, 1
    ScrCmd_01C 1, _017A
    ScrCmd_02C 11
    ScrCmd_028 0x8004, 10
    ScrCmd_014 0x7D9
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_016F:
    ScrCmd_02C 12
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_017A:
    ScrCmd_02C 13
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

    .byte 73
    .byte 0
    .byte 220
    .byte 5
    .byte 96
    .byte 0
    .byte 104
    .byte 0
    .byte 44
    .byte 0
    .byte 10
    .byte 49
    .byte 0
    .byte 52
    .byte 0
    .byte 97
    .byte 0
    .byte 2
    .byte 0

_0198:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_014 0x7E3
    ScrCmd_035
    ScrCmd_148 10
    ScrCmd_061
    ScrCmd_002

_01AE:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_014 0x7E3
    ScrCmd_035
    ScrCmd_148 11
    ScrCmd_061
    ScrCmd_002

_01C4:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_02C 14
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

    .byte 0
    .byte 0
    .byte 0
