    .include "macros/scrcmd.inc"

    .data

    .long _0012-.-4
    .long _002B-.-4
    .long _00E0-.-4
    .long _00E2-.-4
    .short 0xFD13

_0012:
    ScrCmd_01E 0x9D7
    ScrCmd_020 228
    ScrCmd_01C 0, _0023
    ScrCmd_002

_0023:
    ScrCmd_028 0x4091, 0
    ScrCmd_002

_002B:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_0C8 0
    ScrCmd_011 0x4091, 1
    ScrCmd_01C 4, _0095
    ScrCmd_0CD 0
    ScrCmd_020 224
    ScrCmd_01D 0, _008B
    ScrCmd_020 224
    ScrCmd_01D 1, _0090
    ScrCmd_0CD 0
    ScrCmd_04E 0x481
    ScrCmd_02C 1
    ScrCmd_04F
    ScrCmd_01E 224
    ScrCmd_028 0x4091, 1
    ScrCmd_02C 2
    ScrCmd_031
    ScrCmd_034
    ScrCmd_028 0x403F, 0x264
    ScrCmd_161
    ScrCmd_06D 4, 48
    ScrCmd_061
    ScrCmd_002

_008B:
    ScrCmd_02C 0
    ScrCmd_01B

_0090:
    ScrCmd_02C 3
    ScrCmd_01B

_0095:
    ScrCmd_011 0x40E2, 2
    ScrCmd_01C 4, _00C4
    ScrCmd_011 0x40E2, 1
    ScrCmd_01C 1, _00BB
    ScrCmd_0CD 0
    ScrCmd_02C 9
    ScrCmd_016 _00D2

_00BB:
    ScrCmd_02C 10
    ScrCmd_016 _00D2

_00C4:
    ScrCmd_0CD 0
    ScrCmd_02C 11
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_00D2:
    ScrCmd_026 0x40E2, 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    ScrCmd_002

_00E0:
    ScrCmd_002

_00E2:
    ScrCmd_060
    ScrCmd_162
    ScrCmd_06D 4, 16
    ScrCmd_1BD 0x800C
    ScrCmd_011 0x800C, 2
    ScrCmd_01C 1, _0103
    ScrCmd_016 _011B

_0103:
    ScrCmd_05E 0xFF, _0194
    ScrCmd_05E 4, _01D8
    ScrCmd_05F
    ScrCmd_016 _0133

_011B:
    ScrCmd_05E 0xFF, _019C
    ScrCmd_05E 4, _01E4
    ScrCmd_05F
    ScrCmd_016 _0133

_0133:
    ScrCmd_0CD 0
    ScrCmd_02C 5
    ScrCmd_034
    ScrCmd_1BD 0x800C
    ScrCmd_011 0x800C, 3
    ScrCmd_01C 1, _0152
    ScrCmd_016 _016A

_0152:
    ScrCmd_05E 0xFF, _01A4
    ScrCmd_05E 4, _01F0
    ScrCmd_05F
    ScrCmd_016 _0182

_016A:
    ScrCmd_05E 0xFF, _01B0
    ScrCmd_05E 4, _0200
    ScrCmd_05F
    ScrCmd_016 _0182

_0182:
    ScrCmd_065 4
    ScrCmd_01E 228
    ScrCmd_028 0x4091, 2
    ScrCmd_061
    ScrCmd_002

    .balign 4, 0
_0194:
    MoveAction_023
    EndMovement

    .balign 4, 0
_019C:
    MoveAction_020
    EndMovement

    .balign 4, 0
_01A4:
    MoveAction_00C
    MoveAction_021
    EndMovement

    .balign 4, 0
_01B0:
    MoveAction_00F
    MoveAction_022
    EndMovement

    .byte 63
    .byte 0
    .byte 5
    .byte 0
    .byte 14
    .byte 0
    .byte 1
    .byte 0
    .byte 254
    .byte 0
    .byte 0
    .byte 0
    .byte 63
    .byte 0
    .byte 5
    .byte 0
    .byte 12
    .byte 0
    .byte 1
    .byte 0
    .byte 34
    .byte 0
    .byte 1
    .byte 0
    .byte 254
    .byte 0
    .byte 0
    .byte 0

    .balign 4, 0
_01D8:
    MoveAction_022
    MoveAction_04B
    EndMovement

    .balign 4, 0
_01E4:
    MoveAction_021
    MoveAction_04B
    EndMovement

    .balign 4, 0
_01F0:
    MoveAction_03F 3
    MoveAction_00E
    MoveAction_021
    EndMovement

    .balign 4, 0
_0200:
    MoveAction_03F 3
    MoveAction_00D
    MoveAction_021
    EndMovement
