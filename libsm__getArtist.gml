///string libsm__getArtist(int songID, bool translit)

// Returns song artist
// If translit is TRUE, the transliterated artist will be returned instead
// Returns empty string if no artist was specified

var songID, translit, keyword;
songID = argument[0];
if (argument_count > 1) {
   translit = argument[1];
   } else {
   translit = FALSE;
   }

if (translit) {
   keyword = "#ARTISTTRANSLIT:";
   } else {
   keyword = "#ARTIST:";
   }

return libsm__readMetadata(songID, keyword);
