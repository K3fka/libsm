///string libsm__readMetadata(int songID, string keyword)

// sm files store metadata in the format #KEY:VALUE;
// This function returns the VALUE portion of the line in an sm file with the
// specified key
// Returns empty string if the line was not found

var songID, keyword, value, line;
songID = argument[0];
keyword = argument[1];

value = ""; //On error return empty string

while(!file_text_eof(songID)) {
    line = file_text_readln(songID);
    if (string_pos(keyword, line)) {
       value = string_copy(line, string_length(keyword) + 1,      //+1 to filter out the colon
               string_length(line) - string_length(keyword) - 3); //-3 to filter out semicolon
       }
    }
    
return value;
