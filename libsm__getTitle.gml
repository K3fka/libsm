///string libsm__getTitle(array songID, bool translit)

// Returns song title
// If translit is TRUE, the transliterated title will be returned instead
// Returns empty string if no title was specified

var songID, translit, keyword;
songID = argument[0];
if (argument_count > 1) {
   translit = argument[1];
   } else {
   translit = FALSE;
   }

if (translit) {
   keyword = "#TITLETRANSLIT:";
   } else {
   keyword = "#TITLE:";
   }

return libsm__readMetadata(songID, keyword);
