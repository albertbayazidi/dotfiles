cc := clang
src := src
lib := lib
obj := $(src)/obj
project_name := main

inc := -I$(lib)

cflags_release := -Wall -O3
cflags_debug   := -Wall -O0 -g -fsanitize=address

src_files := $(wildcard $(src)/*.c)
obj_files := $(patsubst $(src)/%.c,$(obj)/%.o,$(src_files))
obj_files_debug := $(patsubst $(src)/%.c,$(obj)/%_debug.o,$(src_files))

all: release

release: $(obj_files)
	$(cc) $(cflags_release) $(inc) -o $(project_name) $^

debug: $(obj_files_debug)
	$(cc) $(cflags_debug) $(inc) -o $(project_name)_debug $^

$(obj)/%.o: $(src)/%.c | $(obj)
	$(cc) $(cflags_release) $(inc) -c $< -o $@

$(obj)/%_debug.o: $(src)/%.c | $(obj)
	$(cc) $(cflags_debug) $(inc) -c $< -o $@

$(obj):
	mkdir -p $(obj)

.PHONY: clean
clean:
	rm -rf $(project_name) $(project_name)_debug $(obj)/*.o $(obj)/*_debug.o
