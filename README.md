# ada-led-stm32
led example for stm32f4xx writen in Ada language.

for compile use:

arm-eabi-gnatmake -P step1.gpr

then make binary file:

arm-eabi-objcopy -O binary main main.bin

then program with st-util:

st-flash write main.bin 0x8000000
