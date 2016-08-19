///string libsm__getNoteData(string song, string chartType, string difficulty)

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

// On error, the returned ds_list will be empty

var song, chartType, difficulty, file, tmpArray, tmpList;
song = argument[0];
chartType = argument[1];
difficulty = argument[2];
tmpArray[0] = "";
tmpList = ds_list_create();


while (string_pos(chartType + ":", song)) {
    song = string_delete(song, 1, string_pos(chartType + ":", song));
    song = string_delete(song, 1, string_pos(":", song)); //skip "description" line
    if (string_pos(difficulty + ":", song) < string_pos(";", song)) {
        while (string_pos(":", song) < string_pos(";", song)) {
            song = string_delete(song, 1, string_pos(chr(10), song)); //skip any lines between difficulty and actual note data
        }
        //Save some memory by reducing the simfile in memory to only this specific chart and difficulty
        song = string_copy(song, 1, string_pos(";", song) + 2);
        //This is a workaround to get the last measure to load in properly
        song = string_replace_all(song, ";", ","+chr(10)+";");
        var i = 0;
        while (string_pos(chr(10), song) < string_pos(";", song)) {
            var p = string_pos(chr(10), song);
            var line = string_copy(song, 1, p);
            song = string_delete(song, 1, p);
            if (array_length_1d(tmpArray) < (i + 1)) {
                tmpArray[i] = "";
            }
            if (string_pos(",", line)) {
                tmpArray[i] = string_replace_all(tmpArray[i], chr(10), ","); //replace \n with comma
                tmpArray[i] = string_replace_all(tmpArray[i], chr(13), ""); //get rid of \r (part of Windows line endings)
                tmpArray[i] = string_delete(tmpArray[i], string_length(tmpArray[i]), 1); //truncate trailing comma
                ds_list_insert(tmpList, i, tmpArray[i]);
                i++;
            } else {
                //We don't want to pull in any blank lines
                if (string_replace_all(string_replace_all(line, chr(13), ""), chr(10), "") != "") {
                    tmpArray[i] += line;
                }
            }
        }
    }
}

//Encode as string and such to prevent memory leaks
var list = ds_list_write(tmpList);
ds_list_destroy(tmpList);

return list;
