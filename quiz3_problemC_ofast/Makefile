BASE_ADDR = /home/chris0/riscv-none-elf-gcc/rv32emu
include $(BASE_ADDR)/mk/toolchain.mk

ARCH = -march=rv32izicsr
LINKER_SCRIPT = linker.ld

EMU ?= $(BASE_ADDR)/build/rv32emu

AFLAGS = -g $(ARCH)
CFLAGS = -g -march=rv32i_zicsr -Ofast
LDFLAGS = -T $(LINKER_SCRIPT)
EXEC = test.elf

CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld

OBJS = start.o main.o perfcounter.o rsqrt_org.o

all: $(EXEC)

%.o: %.S
	$(AS) $(AFLAGS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@ -c

$(EXEC): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

run: $(EXEC)
	@test -f $(EMU) || (echo "Error: $(EMU) not found" && exit 1)
	#@grep -q "ENABLE_ELF_LOADER=1" $(BASE_ADDR)/build/.config || (echo "Error: ENABLE_ELF_LOADER=1 not set" && exit 1)
	#@grep -q "ENABLE_SYSTEM=1" $(BASE_ADDR)/build/.config || (echo "Error: ENABLE_SYSTEM=1 not set" && exit 1)
	$(EMU) $<

dump: $(EXEC)
	$(OBJDUMP) -Ds $< | less

clean:
	rm -f $(EXEC) $(OBJS)
