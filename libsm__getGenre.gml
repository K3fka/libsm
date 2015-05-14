///string libsm__getGenre(int songID)

// Returns song genre
// Returns empty string if no genre was specified

var songID, keyword;
songID = argument[0];
keyword = "#GENRE:";

return libsm__readMetadata(songID, keyword);
