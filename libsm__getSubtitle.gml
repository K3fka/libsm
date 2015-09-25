///string libsm__getSubtitle(string song, bool translit)

// Returns song subtitle
// If translit is TRUE, the transliterated subtitle will be returned instead
// Returns -1 if no subtitle was specified

var song, translit, keyword;
song = argument[0];
if (argument_count > 1) {
    translit = argument[1];
} else {
    translit = false;
}

if (translit) {
    keyword = "#SUBTITLETRANSLIT:";
} else {
    keyword = "#SUBTITLE:";
}

return libsm__readMetadata(song, keyword);
