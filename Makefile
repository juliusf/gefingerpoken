
INC_PATH= 

CC= clang
LD_PATH= 
LIBS= 
LDFLAGS= 
CFLAGS= -std=gnu99 $(INC_PATH) -pedantic -Wall -Wextra -Werror -Wno-unused-function -Wno-unused-parameter -Wno-overlength-strings -g

SOURCES=$(wildcard src/*.c)
OBJECTS=$(patsubst %.c, %.o, $(SOURCES))
EXECUTABLE=bin/fingerpoken

all:    build $(EXECUTABLE)

$(EXECUTABLE):  $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) $(LD_PATH) $(LIBS) -o $(EXECUTABLE)


$(OBJECTS): src/%.o : src/%.c
	    $(CC) $(CFLAGS) -c $< $(LD_PATH) $(LIBS) -o $@
build:
	    @mkdir -p bin
clean:
	    rm -rf $(EXECUTABLE) $(OBJECTS) bin
		find . -name "*~" -exec rm {} \;
	    find . -name "*.o" -exec rm {} \;
