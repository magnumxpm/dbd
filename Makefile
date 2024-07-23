CC = clang
CFLAGS = -Wall
SRC = src
OBJ = obj
SRCS = $(wildcard $(SRC)/*.c)
OBJS = $(patsubst $(SRC)/%.c,$(OBJ)/%.o,$(SRCS))
BINDIR = bin
BIN = $(BINDIR)/dbd

.PHONY: clean all

all: $(BIN)
	@echo "Finished linking"
	@echo "Generating output..."
	@echo "----------------------------------"
	@$(BIN)
	@echo "----------------------------------"

$(BIN): $(OBJS) | $(BINDIR)
	@echo "Linking object files..."
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c | $(OBJ)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ):
	mkdir -p $(OBJ)

$(BINDIR):
	mkdir -p $(BINDIR)

clean:
	rm -rf $(BINDIR)/* $(OBJ)/*
	@echo "Cleaned"
