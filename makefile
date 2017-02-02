CC = ccsc
PK2 = pk2cmd
PK3 = pk3cmd

DEVICE = PIC18F25K22

SRC = src
OUT = Debug
REL = Release

UNIT = SICK
UINT_FILE = programmer

OBJS += *.ccspjt *.cof *.err *.esym *.hex *.lst *.xsym
MOBJ = $(OBJS:%=$(SRC)/%)

ifeq ($(DEVICE), PIC24FJ256GB206)
CFLAGS += +FD
DFLAGS += +GM_UC=""
endif
ifeq ($(DEVICE), PIC24FJ1024GB606)
CFLAGS += +FD
DFLAGS += +GM_UC="M_PIC24FJ1024GB606"
endif
ifeq ($(DEVICE), PIC24FJ64GB002)
CFLAGS += +FD
DFLAGS += +GM_UC=""
endif
ifeq ($(DEVICE), PIC18F46K22)
CFLAGS += +FH
DFLAGS += +GM_UC="M_PIC18F46K22"
endif
ifeq ($(DEVICE), PIC18F25K22)
CFLAGS += +FH
DFLAGS += +GM_UC="M_PIC18F25K22"
endif
ifeq ($(DEVICE), PIC18F252)
CFLAGS += +FH
DFLAGS += +GM_UC=""
endif

#DFLAGS += +GFAST=""
#DFLAGS += +GUSE_PIVO_STR=""
#DFLAGS += +GUSE_WDT=""
#DFLAGS += +GDEBUG=""
#DFLAGS += +GUSE_EXTERNAL_EEPROM=""
#DFLAGS += +GEEPROM_TYPE="EEPROM_24LC256"
CFLAGS += +LN -T -A -M -Z +DF +Y=9 +STDOUT +EA
TFLAGS += +FB +LN -T -A -M -Z +DF +Y=9 +STDOUT +EA
PK2DELFLAGS += -E -P$(DEVICE)
PK2FLAGS +=$(PK2DELFLAGS) -M -R -J -F
PK3FLAGS = -P18F25K22 -GF

all: $(UNIT)

$(UNIT): $(SRC)/$(UINT_FILE).c
	$(CC) $(CFLAGS) $(DFLAGS) $<
	[[ -d $(OUT) ]] || mkdir $(OUT)
	mv $(MOBJ) $(OUT)
	
Release: $(SRC)/$(UINT_FILE).c
	$(CC) $(CFLAGS) $(RDFLAGS) $<
	[[ -d $(REL) ]] || mkdir $(REL)
	mv $(MOBJ) $(REL)
	
teste: $(SRC)/teste.c
	$(CC) $(CFLAGS) $(DFLAGS) $<
	mv $(MOBJ) $(OUT)
	
timer: $(SRC)/timer.c
	$(CC) $(TFLAGS) $<
	mv $(MOBJ) $(OUT)
	
burn_release: $(REL)/$(UINT_FILE).hex
	$(PK2) $(PK2FLAGS) $<
	
burn_teste: $(OUT)/teste.hex
	$(PK2) $(PK2FLAGS) $<
	
burn_pk2cmd: $(OUT)/$(UINT_FILE).hex
	$(PK2) $(PK2FLAGS) $<
	
burn_pk3cmd: $(OUT)/$(UINT_FILE).hex
	$(PK3) $(PK3FLAGS)$<
	
erase:
	$(PK2) $(PK2DELFLAGS) 
	
clean:
	rm -Rvf $(OUT)/*
	
clean_release:
	rm -Rvf $(REL)
