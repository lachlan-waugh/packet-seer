EXE	:= main

SRC_DIR	:= src
OBJ_DIR	:= obj

SRC	:= $(wildcard $(SRC_DIR)/*.c)
OBJ	:= $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CPPFLAGS	:= -Iinclude
CFLAGS	:= -Wall
LDLIBS	:= -lpcap -lm

.PHONY:	all clean

all:	$(EXE)

$(EXE):	$(OBJ)
	$(CC) $^ $(LDLIBS) -o $@

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir $@

clean:
	$(RM) $(OBJ)