///float libsm__getOffset(array songID)

// Returns offset between song and note start times, in seconds
// Returns 0 if no offset was specified

var songID, keyword;
songID = argument[0];
keyword = "#OFFSET:";

return libsm__readMetadata(songID, keyword);
