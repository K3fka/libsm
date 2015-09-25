///string libsm__getArtist(string song, bool translit)

// Returns song artist
// If translit is TRUE, the transliterated artist will be returned instead
// Returns empty string if no artist was specified

var song, translit, keyword;
song = argument[0];
if (argument_count > 1) {
    translit = argument[1];
} else {
    translit = false;
}

if (translit) {
    keyword = "#ARTISTTRANSLIT:";
} else {
    keyword = "#ARTIST:";
}

return libsm__readMetadata(song, keyword);
