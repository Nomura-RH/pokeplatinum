#ifndef POKEPLATINUM_OV5_021E1D20_H
#define POKEPLATINUM_OV5_021E1D20_H

#include "field/field_system.h"

#include "bg_window.h"
#include "message.h"
#include "play_time.h"
#include "string_template.h"
#include "trainer_info.h"

typedef struct UnkStruct_ov5_021E1D20 {
    int unk_00;
    int unk_04;
    TrainerInfo *unk_08;
    PlayTime *playTime;
} UnkStruct_ov5_021E1D20;

typedef struct UnkStruct_ov5_021E1FF4 {
    FieldSystem *fieldSystem;
    int unk_04;
    u8 unk_08;
    BgConfig *unk_0C;
    Window *unk_10;
    StringTemplate *unk_14;
    MessageLoader *unk_18;
    UnkStruct_ov5_021E1D20 unk_1C;
    int unk_2C;
    int unk_30;
} UnkStruct_ov5_021E1FF4;

void ov5_021E1F04(UnkStruct_ov5_021E1FF4 *param0);
void ov5_021E1F7C(UnkStruct_ov5_021E1FF4 *param0);
UnkStruct_ov5_021E1FF4 *ov5_021E1F98(FieldSystem *fieldSystem, int param1, u8 param2);
void ov5_021E1FF4(UnkStruct_ov5_021E1FF4 *param0);
BOOL ov5_021E200C(FieldSystem *fieldSystem);
void ov5_021E2064(FieldSystem *fieldSystem);

#endif // POKEPLATINUM_OV5_021E1D20_H
