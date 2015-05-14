///string libsm__getSubtitle(int songID, bool translit)

// Returns song subtitle
// If translit is TRUE, the transliterated subtitle will be returned instead
// Returns -1 if no subtitle was specified

var songID, translit, keyword;
songID = argument[0];
if (argument_count > 1) {
   translit = argument[1];
   } else {
   translit = FALSE;
   }

if (translit) {
   keyword = "#SUBTITLETRANSLIT:";
   } else {
   keyword = "#SUBTITLE:";
   }

return libsm__readMetadata(songID, keyword);
