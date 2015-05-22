///array libsm__open(string path)

// Returns an array
// [0] is the file handle
// [1] is the file name
// Returns -1 if file could not be opened

var file;
file[1] = argument[0];
file[0] = file_text_open_read(file[1]);

if (file[0] != -1) {
   file_text_close(file[0]);
   }

return file;
