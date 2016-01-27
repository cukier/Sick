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

GLOBALS=+GWAIT_TIMEL="5"

PK2FLAGS=-E -P$(DEVICE) -M -R -J -F

all: $(UNIT1)

$(UNIT1): $(SRC)/$(UNIT1_FILE).c
	cp $(SRC)/*.[ch] $(OUT)
	$(CC) $(HFLAGS) $(GLOBALS) $(OUT)/$(UNIT1_FILE).c
	
burn:
	$(PK2) $(PK2FLAGS) $(OUT)/$(UNIT1_FILE).hex

clean:
	rm $(OUT)/*