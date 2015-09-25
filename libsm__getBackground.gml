///string libsm__getBackground(string song)

// Returns the path to the song's background file
// Returns empty string if no background could be found

var song, keyword;
song = argument[0];
keyword = "#BACKGROUND:";

return libsm__readMetadata(song, keyword);
