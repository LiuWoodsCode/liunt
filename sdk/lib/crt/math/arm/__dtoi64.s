/*
 * PROJECT:     ReactOS CRT library
 * LICENSE:     MIT (https://spdx.org/licenses/MIT)
 * PURPOSE:     Implementation of __dtoi64
 * COPYRIGHT:   Copyright 2015 Timo Kreuzer <timo.kreuzer@reactos.org>
 *              Copyright 2021 Roman Masanin <36927roma@gmail.com>
 */

/* INCLUDES ******************************************************************/

#include <kxarm.h>

    IMPORT __dtoi64_worker

/* CODE **********************************************************************/

    TEXTAREA

    /*
        IN: d0 = double value
        OUT: r1:r0 = int64 value
    */
    LEAF_ENTRY __dtoi64
    /* Allocate stack space and store parameters there */
    push {lr}
    PROLOG_END

    /* Call the C worker function */
    VMOV r0,d0[0]
    VMOV r1,d0[1]
    bl __dtoi64_worker

    /* Move result data into the appropriate registers and return */
    pop {pc}
    LEAF_END __dtoi64

    END
/* EOF */
