cc := clang
src := src
lib := lib
obj := $(src)/obj
project_name := name-here-make-file

inc := -I$(lib) -lm
cflags := -Wall -O3

src_files := $(wildcard $(src)/*.c)

obj_files := $(patsubst $(src)/%.c,$(obj)/%.o,$(src_files))

all: $(project_name)

$(project_name): $(obj_files)
	$(cc) $(cflags) $(inc) -o $@ $^

$(obj)/%.o: $(src)/%.c
	$(cc) $(cflags) $(inc) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(project_name) $(obj)/*.o
