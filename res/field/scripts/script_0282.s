    .include "macros/scrcmd.inc"

    .data

    .long _000A-.-4
    .long _000C-.-4
    .short 0xFD13

_000A:
    End

_000C:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_208 0x1E8, 1
    ScrCmd_030
    ScrCmd_209
    ScrCmd_04C 0x1E8, 0
    ScrCmd_1BD 0x800C
    ScrCmd_011 0x800C, 0
    ScrCmd_01D 1, _007E
    ScrCmd_063 0
    ScrCmd_26A 0, 6, 8
    ScrCmd_062 0
    SetFlag 0x24F
    ScrCmd_065 0
    ScrCmd_21C 1
    ScrCmd_011 0x4058, 3
    ScrCmd_01C 1, _0074
    ClearFlag 0x452
    ScrCmd_064 1
    SetFlag 0x11F
    ScrCmd_02C 0
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0074:
    ScrCmd_028 0x4058, 0
    ScrCmd_061
    End

_007E:
    ScrCmd_186 1, 16, 14
    ScrCmd_05E 0, _0094
    ScrCmd_05F
    Return

    .balign 4, 0
_0094:
    MoveAction_047
    MoveAction_00C
    MoveAction_048
    EndMovement
