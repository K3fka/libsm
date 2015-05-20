///string libsm__getBackground(array songID)

// Returns the path to the song's background file
// Returns empty string if no background could be found

var songID, keyword;
songID = argument[0];
keyword = "#BACKGROUND:";

return libsm__readMetadata(songID, keyword);