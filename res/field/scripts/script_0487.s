    .include "macros/scrcmd.inc"

    .data

    .long _0006-.-4
    .short 0xFD13

_0006:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    CheckFlag 217
    ScrCmd_01C 1, _004B
    ScrCmd_02C 0
    ScrCmd_028 0x8004, 30
    ScrCmd_028 0x8005, 1
    ScrCmd_07D 0x8004, 0x8005, 0x800C
    ScrCmd_011 0x800C, 0
    ScrCmd_01C 1, _0056
    ScrCmd_014 0x7FC
    SetFlag 217
    GoTo _004B

_004B:
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0056:
    ScrCmd_014 0x7E1
    ScrCmd_034
    ScrCmd_061
    End
