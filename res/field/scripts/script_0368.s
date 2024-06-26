    .include "macros/scrcmd.inc"

    .data

    .long _0012-.-4
    .long _0146-.-4
    .long _015C-.-4
    .long _0172-.-4
    .short 0xFD13

_0012:
    ScrCmd_011 0x40DB, 0
    ScrCmd_01D 5, _008A
    ScrCmd_1DD 43, 0, 0x400A
    ScrCmd_01A _008E
    ScrCmd_011 0x400A, 2
    ScrCmd_01D 1, _009E
    ScrCmd_011 0x400A, 3
    ScrCmd_01D 1, _009E
    ScrCmd_011 0x400A, 0
    ScrCmd_01D 1, _008E
    ScrCmd_011 0x400A, 1
    ScrCmd_01D 1, _008E
    ScrCmd_011 0x400A, 4
    ScrCmd_01D 1, _0096
    ScrCmd_011 0x400A, 5
    ScrCmd_01D 1, _0096
    ScrCmd_011 0x400A, 6
    ScrCmd_01D 1, _0096
    ScrCmd_002

_008A:
    ScrCmd_265
    ScrCmd_01B

_008E:
    ScrCmd_028 0x402A, 231
    ScrCmd_01B

_0096:
    ScrCmd_028 0x402A, 235
    ScrCmd_01B

_009E:
    ScrCmd_028 0x402A, 232
    ScrCmd_01B

_00A6:
    ScrCmd_0BC 6, 1, 0, 0
    ScrCmd_0BD
    ScrCmd_1DD 43, 0, 0x800C
    ScrCmd_011 0x800C, 4
    ScrCmd_01C 1, _01F8
    ScrCmd_011 0x800C, 5
    ScrCmd_01C 1, _01F8
    ScrCmd_1F8
    ScrCmd_2C4 5
    ScrCmd_0A1
    ScrCmd_0BE 0x146, 0, 15, 6, 0
    ScrCmd_002

_00E9:
    ScrCmd_0BC 6, 1, 0, 0
    ScrCmd_0BD
    ScrCmd_1F8
    ScrCmd_2C4 6
    ScrCmd_0A1
    ScrCmd_0BE 0x146, 0, 11, 6, 0
    ScrCmd_002

_010A:
    ScrCmd_0BC 6, 1, 0, 0
    ScrCmd_0BD
    ScrCmd_0BE 0x1ED, 0, 8, 2, 1
    ScrCmd_0BC 6, 1, 1, 0
    ScrCmd_0BD
    ScrCmd_061
    ScrCmd_002

_0132:
    ScrCmd_01A _0188
    ScrCmd_23C 0x4000, 3
    ScrCmd_01A _0194
    ScrCmd_01B

_0146:
    ScrCmd_060
    ScrCmd_028 0x4000, 0
    ScrCmd_01A _0132
    ScrCmd_016 _00A6
    ScrCmd_002

_015C:
    ScrCmd_060
    ScrCmd_028 0x4000, 0
    ScrCmd_01A _0132
    ScrCmd_016 _00E9
    ScrCmd_002

_0172:
    ScrCmd_060
    ScrCmd_028 0x4000, 1
    ScrCmd_01A _0132
    ScrCmd_016 _010A
    ScrCmd_002

_0188:
    ScrCmd_05E 0xFF, _01BC
    ScrCmd_05F
    ScrCmd_01B

_0194:
    ScrCmd_05E 0, _01C8
    ScrCmd_05E 0xFF, _01E4
    ScrCmd_05F
    ScrCmd_01B

    .byte 12
    .byte 0
    .byte 2
    .byte 0
    .byte 3
    .byte 0
    .byte 1
    .byte 0
    .byte 15
    .byte 0
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 254
    .byte 0
    .byte 0
    .byte 0

    .balign 4, 0
_01BC:
    MoveAction_00C 2
    MoveAction_001
    EndMovement

    .balign 4, 0
_01C8:
    MoveAction_00D
    MoveAction_002
    MoveAction_00E
    MoveAction_001
    MoveAction_00D
    MoveAction_045
    EndMovement

    .balign 4, 0
_01E4:
    MoveAction_03F 2
    MoveAction_03D
    MoveAction_00D 2
    MoveAction_045
    EndMovement

_01F8:
    ScrCmd_1F8
    ScrCmd_2C4 5
    ScrCmd_0A1
    ScrCmd_0BE 0x146, 0, 19, 6, 0
    ScrCmd_002

    .byte 0
    .byte 0
    .byte 0
