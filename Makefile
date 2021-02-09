CC=clang
CXX=clang++

BIN_PSP=pspdecrypt
BIN_PSAR=psardecrypt
LIBKIRK_SRCS=$(wildcard libkirk/*.c)
OBJS_PSP=pspdecrypt.o PrxDecrypter.o $(LIBKIRK_SRCS:%.c=%.o)
OBJS_PSAR=libLZR.o kl4e.o common.o ipl_decrypt.o pspdecrypt_lib.o PrxDecrypter.o psardecrypt.o PsarDecrypter.o $(LIBKIRK_SRCS:%.c=%.o)

all: $(BIN_PSP) $(BIN_PSAR)

$(BIN_PSP): $(OBJS_PSP)
	clang++ -o $@ $(OBJS_PSP)
	mkdir -p ./release && mv $(BIN_PSP) ./release

$(BIN_PSAR): $(OBJS_PSAR)
	clang++ -o $@ $(OBJS_PSAR) -lz -lcrypto
	mkdir -p ./release && mv $(BIN_PSAR) ./release

clean:
	rm -f $(OBJS_PSP) $(OBJS_PSAR)
