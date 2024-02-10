#!/bin/bash

#BREAKPOINT_SYMBOL=ti_sysbios_knl_Task_startup
#BREAKPOINT_SYMBOL1=ti_sysbios_knl_Swi_runLoop
#BREAKPOINT_SYMBOL2=ti_sysbios_knl_Swi_run
EXTRA_GDB_ARGUMENTS=(
#-ex "b ti_sysbios_knl_Swi_post"
#-ex "b Swi.c:424"
# write to 0x43000000~
#-ex "b *0x5CC4"
-ex "set substitute-path /project /home/alon/ti/simplelink_cc13xx_cc26xx_sdk_6_10_00_29"
-ex "set substitute-path dpl /home/alon/ti/simplelink_cc13xx_cc26xx_sdk_6_10_00_29/kernel/nortos/dpl"
-ex "set substitute-path /scratch/xlibrary/.conan/data/coresdk_cc13xx_cc26xx/6.10.00.13/library-sb/ga/build/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/exports/coresdk_cc13xx_cc26xx_6_10_00_13 /home/alon/ti/simplelink_cc13xx_cc26xx_sdk_6_10_00_29"
#-ex "b SwiP_construct"
#-ex "b RF_open"
#-ex "b NOROM_PRCMPowerDomainsAllOn"
#-x "b PowerCC26XX_standbyPolicy"
# This did not actually work, why?
# -x "b *(void *)0x5A7e"
)
BREAKPOINT_SYMBOL2=Swi.c:424


arm-none-eabi-gdb example.elf \
        -ex 'target remote :3333' \
        -ex 'set substitute-path ./../../.. /home/alon/ti/simplelink_cc13xx_cc26xx_sdk_6_10_00_29/source/ti/devices/cc13x2_cc26x2' \
        -ex 'set substitute-path /home/developer/.conan/data/coresdk_cc13xx_cc26xx/6.10.00.13/library-sb/ga/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9 /home/alon/ti/simplelink_cc13xx_cc26xx_sdk_6_10_00_29/' \
        "${EXTRA_GDB_ARGUMENTS[@]}"
