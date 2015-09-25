///int libsm__getSampleStart(string song)

// Returns the time (in seconds) that should be used as the beginning of the music sample
// Returns -1 if no sample start time was defined

var song, keyword, value;
song = argument[0];
keyword = "#SAMPLESTART:";

value = libsm__readMetadata(song, keyword);
if (value != "") {
    value = real(value);
} else {
    value = -1;
}

return value;
