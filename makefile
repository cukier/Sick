CC=ccsc
PK2=pk2cmd

DEVICE=PIC18F252
UNIT1=SICK
UNIT1_FILE=programmer

HFLAGS=+FH +LN -T -A -M -Z +DF +Y=9 +STDOUT +EA
BFLAGS=+FB +LN -T -A -M -Z +DF +Y=9 +STDOUT +EA
MFLAGS=+FM +LN -T -A -M -Z +DF +Y=9 +STDOUT +EA
SRC=src
OUT=Debug

PK2FLAGS=-E -P$(DEVICE) -M -R -J -F

all: $(UNIT1)

$(UNIT1): $(SRC)/$(UNIT1_FILE).c		
	if [ ! -d $(OUT) ]; then mkdir $(OUT); fi
	cp $(SRC)/*.[ch] $(OUT)
	$(CC) $(HFLAGS) $(GLOBALS) $(OUT)/$(UNIT1_FILE).c
	[ ! -d $(OUT)/src ] && mkdir $(OUT)/src || rm -Rvf $(OUT)/src/*
	mv $(OUT)/*.[ch] $(OUT)/src 
	
burn:
	$(PK2) $(PK2FLAGS) $(OUT)/$(UNIT1_FILE).hex

clean:
	rm -Rvf $(OUT)/*

	