CC =# REQUIRED
lib =
inc =


src_ext =# REQUIRED 
src_dir = src
src := $(shell find $(src_dir) -name '*$(src_ext)') 

dep_dir = src
dep := $(shell find $(dep_dir) -name '*.h')

obj_dir = obj
obj = $(src:$(src_dir)/%.c=$(obj_dir)/%.o)

bin_dir = bin
bin_name = meow
bin = $(bin_dir)/$(bin_name)

$(bin): $(obj)
	$(CC) -o $@ $(obj) $(lib) $(inc)

$(obj_dir)/%.o: $(src_dir)/%.c $(dep)
	$(CC) -c $< -o $@ 

clean:
	rm -f $(bin) $(obj)
