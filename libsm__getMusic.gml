///string libsm__getMusic(string song)

// Returns the path to the song's music file
// Returns empty string if no music file could be found

var song, keyword;
song = argument[0];
keyword = "#MUSIC:";

return libsm__readMetadata(song, keyword);
