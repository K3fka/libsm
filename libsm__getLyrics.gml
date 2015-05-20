///string libsm__getLyrics(array songID)

// Returns the path to the song's lyrics file
// Returns empty string if no lyrics could be found

var songID, keyword;
songID = argument[0];
keyword = "#LYRICSPATH:";

return libsm__readMetadata(songID, keyword);