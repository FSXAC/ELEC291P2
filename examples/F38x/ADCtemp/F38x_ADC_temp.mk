CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=F38x_ADC_temp.obj

F38x_ADC_temp.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
F38x_ADC_temp.obj: F38x_ADC_temp.c
	$(CC) -c F38x_ADC_temp.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	F38X_prog F38x_ADC_temp.hex

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: F38x_ADC_temp.hex F38x_ADC_temp.Map
	@echo Nothing to see here!
	
explorer:
	explorer .
		