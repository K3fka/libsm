///string libsm__getBanner(int songID)

// Returns the path to the song's banner file
// Returns empty string if no banner could be found

var songID, keyword;
songID = argument[0];
keyword = "#BANNER:";

return libsm__readMetadata(songID, keyword);
