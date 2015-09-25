///string libsm__getBanner(string song)

// Returns the path to the song's banner file
// Returns empty string if no banner could be found

var song, keyword;
song = argument[0];
keyword = "#BANNER:";

return libsm__readMetadata(song, keyword);
