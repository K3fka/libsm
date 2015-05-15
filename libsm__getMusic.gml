///string libsm__getMusic(array songID)

// Returns the path to the song's music file
// Returns empty string if no music file could be found

var songID, keyword;
songID = argument[0];
keyword = "#MUSIC:";

return libsm__readMetadata(songID, keyword);
