///float libsm__getSampleLength(string song)

// Returns the duration (in seconds) of the music sample
// Returns -1 if no duration was defined

var song, keyword, value;
song = argument[0];
keyword = "#SAMPLELENGTH:";

value = libsm__readMetadata(song, keyword);
if (value != "") {
   value = real(value);
   } else {
   value = -1;
   }

return value;
