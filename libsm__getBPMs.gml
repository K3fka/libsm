///string libsm__getBPMs(array songID)

// Returns a ds_list encoded as a string containing all BPM values
// Take the string returned here and use ds_list_read() to recreate the ds_map
// Remember you will need to destroy the list when you are done parsing

// Keys in the resulting ds_list correspond to measure numbers
// Values represent the BPM values that begin at these measures

// Return value will be an encoded ds_list with the key/value 0 => -1 on error

var songID, keyword, bpmList, tmpArray, tmpList;
songID = argument[0];
keyword = "#BPMS:";

tmpArray[0] = 0;
tmpList = ds_list_create();
bpmList = libsm__readMetadata(songID, keyword);
bpmList += ","; //this is really hacky...

//Get the key=value pairs into an array
var i = 0;
while (string_pos(",", bpmList)) {
    var p = string_pos(",", bpmList);
    tmpArray[i] = string_copy(bpmList, 0, p - 1);
    bpmList = string_delete(bpmList, 1, p);
    i++;
    }

//Error handling
if (tmpArray[0] == "0") {
    ds_list_insert(tmpList, 0, -1);
    var error = ds_list_write(tmpList);
    ds_list_destroy(tmpList);
    return error;
    }

//Format array into ds_list
for (var i = 0; i < array_length_1d(tmpArray); i++) {
    var p = string_pos("=", tmpArray[i]);
    var m = floor(real(string_copy(tmpArray[i], 0, p - 1)));
    var b = real(string_delete(tmpArray[i], 1, p));
    ds_list_insert(tmpList, m, b);
    }

//Encode as string and such to prevent memory leaks
var list = ds_list_write(tmpList);
ds_list_destroy(tmpList);

return list;
