# Program name.
PROG=		gpio

# STM32CubeF4 library name.
LIB=		stm32cubef4

TOOLCHAIN=	arm-none-eabi
AR=		${TOOLCHAIN}-ar
CC=		${TOOLCHAIN}-gcc
OBJCOPY=	${TOOLCHAIN}-objcopy
SIZE=		${TOOLCHAIN}-size

# Program sources.
SRCS=		main.c
# Copied from the CMSIS gcc template.
SRCS+=		startup_stm32f407xx.s
SRCS+=		stm32f4xx_it.c
SRCS+=		system_stm32f4xx.c
# Copied from the STM32F4-Discovery BSP.
SRCS+=		stm32f4_discovery.c

# Compiler flags.
CFLAGS=		-g -O2 -Wall
CFLAGS+=	-Tstm32f407vg.ld
CFLAGS+=	-mcpu=cortex-m4
CFLAGS+=	-mlittle-endian -mthumb -mthumb-interwork
CFLAGS+=	-mfloat-abi=soft -mfpu=fpv4-sp-d16
CFLAGS+=	-ffreestanding

# Preprocessor flags.
CPPFLAGS+=	-DSTM32F407xx
CPPFLAGS+=	-I.
CPPFLAGS+=	-IDrivers/BSP/STM32F4-Discovery
CPPFLAGS+=	-IDrivers/CMSIS/Include
CPPFLAGS+=	-IDrivers/CMSIS/Device/ST/STM32F4xx/Include
CPPFLAGS+=	-IDrivers/STM32F4xx_HAL_Driver/Inc

# Linker flags.
LDFLAGS+=	-LDrivers/STM32F4xx_HAL_Driver
LDFLAGS+=	-l${LIB}

CLEANFILES+=	${PROG}.elf ${PROG}.hex ${PROG}.bin *.o

all: lib prog

# Build STM32F4Cube library.
lib:
	${MAKE} -C Drivers/STM32F4xx_HAL_Driver

prog: 	${PROG}.elf

${PROG}.elf: ${SRCS}
	${CC} ${CFLAGS} ${CPPFLAGS} ${SRCS} ${LDFLAGS} -o $@
	${OBJCOPY} -O ihex   ${PROG}.elf ${PROG}.hex
	${OBJCOPY} -O binary ${PROG}.elf ${PROG}.bin
	${SIZE} ${PROG}.elf

# Program the STM32F4-Discovery board with st-flash(1) via USB.
flash: all
	st-flash --reset write ${PROG}.bin 0x08000000

cleanlib:
	${MAKE} -C Drivers/STM32F4xx_HAL_Driver clean

clean:
	rm -f ${CLEANFILES}

cleanall: cleanlib clean

.PHONY: flash cleanlib clean cleanall
