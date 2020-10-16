PROJECT = fixmath
SRC = .
INC = -I. -I/usr/local/include

CC = gcc
CC_FLAGS  = -O2 -fPIC $(INC) -Wall -Wextra -c

SRC_C   = $(foreach dir, $(SRC), $(wildcard $(dir)/*.c))
OBJ_C   = $(patsubst %.c, %.o, $(SRC_C))
OBJ     = $(OBJ_C)

.PHONY : all
all: $(PROJECT).so

$(PROJECT).so: $(OBJ)
	ld -shared $(OBJ) -o $(PROJECT).so

$(OBJ_C) : %.o : %.c
	$(CC) $(CC_FLAGS) -o $@ $<

.PHONY : clean
clean:
	rm -f $(PROJECT).so $(OBJ)
