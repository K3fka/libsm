///float libsm__getOffset(string song)

// Returns offset between song and note start times, in seconds
// Returns 0 if no offset was specified

var song, keyword;
song = argument[0];
keyword = "#OFFSET:";

return real(libsm__readMetadata(song, keyword));
