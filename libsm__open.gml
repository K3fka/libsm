///string libsm__open(string path)

// Returns a string containing the contents of the file
// Returns empty string if file could not be opened

var path, file, contents;
path = argument[0];
file = file_text_open_read(path);
contents = "";

if (file != -1) {
    while (!file_text_eof(file)) {
        contents += file_text_readln(file);
    }
}

file_text_close(file);
    
return contents;
