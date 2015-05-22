///string libsm__getNoteData(array songID, string chartType, string difficulty)

// Returns a ds_list encoded as a string containing note data for one chart
// chartType will usually be "dance-single" or "dance-double"
// difficulty should be "Beginner", "Easy", "Medium", "Hard", "Challenging", or "Edit"
// More info here: http://www.stepmania.com/wiki/file-formats/sm (#NOTES section)

// Take the string returned here and use ds_list_read() to recreate the ds_map
// Remember you will need to destroy the list when you are done parsing
// The keys in the resulting ds_map will correspond to "measure" numbers
// The values will be in the format "0000,0000,..." (single) or "00000000,00000000,..." (double)
// Potential values for each character are 0, 1, 2, 3, 4, M, K, L, and F
// Again, more info here http://www.stepmania.com/wiki/file-formats/sm (#NOTES section)

var songID, chartType, difficulty, file, tmpArray, tmpList;
songID = argument[0];
chartType = argument[1];
difficulty = argument[2];

file = file_text_open_read(songID[1]);

tmpArray[0] = "";
tmpList = ds_list_create();

while(!file_text_eof(file)) {
    var line = file_text_readln(file);
    if (string_pos(chartType + ":", line)) {
        file_text_readln(file); //skip the "description" line
        line = file_text_readln(file);
        if (string_pos(difficulty + ":", line)) {
            file_text_readln(file); //skip "foot rating" line
            file_text_readln(file); //skip "groove radar" line
            var i = 0;
            while (!string_pos(";", line)) {
                if (array_length_1d(tmpArray) < (i + 1)) {
                    tmpArray[i] = "";
                    }
                line = file_text_readln(file);
                if (string_pos(",", line)) {
                    ds_list_insert(tmpList, i, tmpArray[i]);
                    i++;
                    } else {
                    tmpArray[i] += line;
                    }
                }
            }
        }
    }
    
file_text_close(file);

//Encode as string and such to prevent memory leaks
var list = ds_list_write(tmpList);
ds_list_destroy(tmpList);

return list;
