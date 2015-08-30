#	$OpenBSD: Makefile,v 1.9 2012/08/02 13:38:38 okan Exp $

LIB=		libstm32cubef4.a

.PATH:		Src		# BSD make
VPATH=		Src		# GNU make

TOOLCHAIN=	arm-none-eabi
AR=		${TOOLCHAIN}-ar
AS=		${TOOLCHAIN}-as
CC=		${TOOLCHAIN}-gcc
LD=		${TOOLCHAIN}-ld
OBJCOPY=	${TOOLCHAIN}-objcopy
RANLIB=		${TOOLCHAIN}-ranlib

CFLAGS=		-g -O2 -Wall
CFLAGS+=	-mcpu=cortex-m4
CFLAGS+=	-mlittle-endian -mthumb -mthumb-interwork
CFLAGS+=	-mfloat-abi=soft -mfpu=fpv4-sp-d16
CFLAGS+=	-ffreestanding

CPPFLAGS+=	-DSTM32F407xx
CPPFLAGS+=	-IInc
CPPFLAGS+=	-I../..
CPPFLAGS+=	-I../CMSIS/Include
CPPFLAGS+=	-I../CMSIS/Device/ST/STM32F4xx/Include

OBJS=		${SRCS:.c=.o}

SRCS=		stm32f4xx_hal.c
SRCS+=		stm32f4xx_hal_adc.c
SRCS+=		stm32f4xx_hal_adc_ex.c
SRCS+=		stm32f4xx_hal_can.c
SRCS+=		stm32f4xx_hal_cec.c
SRCS+=		stm32f4xx_hal_cortex.c
SRCS+=		stm32f4xx_hal_crc.c
SRCS+=		stm32f4xx_hal_cryp.c
SRCS+=		stm32f4xx_hal_cryp_ex.c
SRCS+=		stm32f4xx_hal_dac.c
SRCS+=		stm32f4xx_hal_dac_ex.c
SRCS+=		stm32f4xx_hal_dcmi.c
SRCS+=		stm32f4xx_hal_dcmi_ex.c
SRCS+=		stm32f4xx_hal_dma.c
SRCS+=		stm32f4xx_hal_dma2d.c
SRCS+=		stm32f4xx_hal_dma_ex.c
SRCS+=		stm32f4xx_hal_dsi.c
SRCS+=		stm32f4xx_hal_eth.c
SRCS+=		stm32f4xx_hal_flash.c
SRCS+=		stm32f4xx_hal_flash_ex.c
SRCS+=		stm32f4xx_hal_flash_ramfunc.c
SRCS+=		stm32f4xx_hal_fmpi2c.c
SRCS+=		stm32f4xx_hal_fmpi2c_ex.c
SRCS+=		stm32f4xx_hal_gpio.c
SRCS+=		stm32f4xx_hal_hash.c
SRCS+=		stm32f4xx_hal_hash_ex.c
SRCS+=		stm32f4xx_hal_hcd.c
SRCS+=		stm32f4xx_hal_i2c.c
SRCS+=		stm32f4xx_hal_i2c_ex.c
SRCS+=		stm32f4xx_hal_i2s.c
SRCS+=		stm32f4xx_hal_i2s_ex.c
SRCS+=		stm32f4xx_hal_irda.c
SRCS+=		stm32f4xx_hal_iwdg.c
SRCS+=		stm32f4xx_hal_lptim.c
SRCS+=		stm32f4xx_hal_ltdc.c
SRCS+=		stm32f4xx_hal_ltdc_ex.c
SRCS+=		stm32f4xx_hal_msp_template.c
SRCS+=		stm32f4xx_hal_nand.c
SRCS+=		stm32f4xx_hal_nor.c
SRCS+=		stm32f4xx_hal_pccard.c
SRCS+=		stm32f4xx_hal_pcd.c
SRCS+=		stm32f4xx_hal_pcd_ex.c
SRCS+=		stm32f4xx_hal_pwr.c
SRCS+=		stm32f4xx_hal_pwr_ex.c
SRCS+=		stm32f4xx_hal_qspi.c
SRCS+=		stm32f4xx_hal_rcc.c
SRCS+=		stm32f4xx_hal_rcc_ex.c
SRCS+=		stm32f4xx_hal_rng.c
SRCS+=		stm32f4xx_hal_rtc.c
SRCS+=		stm32f4xx_hal_rtc_ex.c
SRCS+=		stm32f4xx_hal_sai.c
SRCS+=		stm32f4xx_hal_sai_ex.c
SRCS+=		stm32f4xx_hal_sd.c
SRCS+=		stm32f4xx_hal_sdram.c
SRCS+=		stm32f4xx_hal_smartcard.c
SRCS+=		stm32f4xx_hal_spdifrx.c
SRCS+=		stm32f4xx_hal_spi.c
SRCS+=		stm32f4xx_hal_sram.c
SRCS+=		stm32f4xx_hal_tim.c
SRCS+=		stm32f4xx_hal_tim_ex.c
SRCS+=		stm32f4xx_hal_uart.c
SRCS+=		stm32f4xx_hal_usart.c
SRCS+=		stm32f4xx_hal_wwdg.c
SRCS+=		stm32f4xx_ll_fmc.c
SRCS+=		stm32f4xx_ll_fsmc.c
SRCS+=		stm32f4xx_ll_sdmmc.c
SRCS+=		stm32f4xx_ll_usb.c

all: ${LIB}

%.o: %.c
	${CC} ${CFLAGS} ${CPPFLAGS} -c -o $@ $^

${LIB}: ${OBJS}
	${AR} -rcs $@ ${OBJS}

clean:
	rm -f ${OBJS} ${LIB}

.PHONY: clean
