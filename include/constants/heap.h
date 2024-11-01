#ifndef POKEPLATINUM_CONSTANTS_HEAP_H
#define POKEPLATINUM_CONSTANTS_HEAP_H

enum HeapId {
    HEAP_ID_SYSTEM = 0,
    HEAP_ID_SAVE,
    HEAP_ID_DEBUG,
    HEAP_ID_APPLICATION,
    HEAP_ID_FIELD,
    HEAP_ID_BATTLE,

    HEAP_ID_POKETCH_MAIN = 7,
    HEAP_ID_POKETCH_APP,

    HEAP_ID_COMMUNICATION = 15,

    HEAP_ID_DISTORTION_WORLD_WARP = 30,

    HEAP_ID_OPTIONS_MENU = 38,

    HEAP_ID_CHOOSE_STARTER_APP = 47,

    HEAP_ID_LIBRARY_TV = 120,
};

enum HeapSize {
    HEAP_SIZE_POKETCH_MAIN = 0xc000,
    HEAP_SIZE_POKETCH_APP = 0xc000,

    HEAP_SIZE_CHOOSE_STARTER_APP = 0x40000,
    HEAP_SIZE_LIBRARY_TV = 0x40000,
    HEAP_SIZE_DISTORTION_WORLD_WARP = 0x50000,
};

#endif // POKEPLATINUM_CONSTANTS_HEAP_H
