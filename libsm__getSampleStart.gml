///int libsm__getSampleStart(int songID)

// Returns the time (in seconds) that should be used as the beginning of the music sample
// Returns -1 if no sample start time was defined

var songID, keyword, value;
songID = argument[0];
keyword = "#SAMPLESTART:";

value = libsm__readMetadata(songID, keyword);
if (value != "") {
   value = real(value);
   } else {
   value = -1;
   }

return value;
