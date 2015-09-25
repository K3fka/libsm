///string libsm__getCDTitle(string song)

// Returns the path to the song's CD title file
// Returns empty string if no CD title could be found

var song, keyword;
song = argument[0];
keyword = "#CDTITLE";

return libsm__readMetadata(song, keyword);
