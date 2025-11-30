CXX = g++
CXXFLAGS = -std=c++17 -Wall -g
LDFLAGS =

# Detect OS
UNAME_S := $(shell uname -s)

# Check for sdl2-config
SDL2_CONFIG := $(shell command -v sdl2-config 2> /dev/null)

ifdef SDL2_CONFIG
    CXXFLAGS += $(shell sdl2-config --cflags)
    LDFLAGS += $(shell sdl2-config --libs)
else
    # Fallback if sdl2-config is missing (though user should install it)
    $(warning sdl2-config not found, using defaults)
    LDFLAGS += -lSDL2
endif

SRC_DIR = src
BIN_DIR = bin
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:.cpp=.o)

# Windows uses run.exe, we use run for consistency in naming, though extensions differ
EXEC = $(BIN_DIR)/run

all: $(EXEC)

$(EXEC): $(OBJS)
	mkdir -p $(BIN_DIR)
	$(CXX) $(OBJS) -o $(EXEC) $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: all
	./$(EXEC)

clean:
	rm -f $(SRC_DIR)/*.o $(EXEC)
	rm -rf $(BIN_DIR)

.PHONY: all clean run
