///float libsm__getSampleLength(array songID)

// Returns the duration (in seconds) of the music sample
// Returns -1 if no duration was defined

var songID, keyword, value;
songID = argument[0];
keyword = "#SAMPLELENGTH:";

value = libsm__readMetadata(songID, keyword);
if (value != "") {
   value = real(value);
   } else {
   value = -1;
   }

return value;