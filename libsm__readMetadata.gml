///string libsm__readMetadata(string song, string keyword)

// sm files store metadata in the format #KEY:VALUE;
// This function returns the VALUE portion of the line in an sm file with the specified key
// Returns empty string if the line was not found

var song, keyword, value;
song = argument[0];
keyword = argument[1];

value = ""; //On error return empty string

var p = string_pos(keyword, song);

if (p) {
    song = string_delete(song, 1, p);
    value = string_copy(song, 1, string_pos(";", song) - 1); //-1 to get rid of semicolon
    value = string_copy(value, string_pos(":", value) + 1, string_length(value)); //get rid of #keyword: portion
    value = string_replace_all(value, chr(10), ""); //get rid of \n
    value = string_replace_all(value, chr(13), ""); //get rid of \r
}

return value;
