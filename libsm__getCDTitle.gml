///string libsm__getCDTitle(int songID)

// Returns the path to the song's CD title file
// Returns empty string if no CD title could be found

var songID, keyword;
songID = argument[0];
keyword = "#CDTITLE";

return libsm__readMetadata(songID, keyword);
