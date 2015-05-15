///string libsm__getCredit(array songID)

// Returns song credit (simfile author or pack/mix)
// Returns empty string if no credit was specified

var songID, keyword;
songID = argument[0];
keyword = "#CREDIT:";

return libsm__readMetadata(songID, keyword);
