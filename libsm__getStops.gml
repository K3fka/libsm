///string libsm__getStops(string song)

// Returns a ds_list encoded as a string containing all stops
// Take the string returned here and use ds_list_read() to recreate the ds_map
// Remember you will need to destroy the list when you are done parsing

// Keys in the resulting ds_list correspond to measure numbers
// Values represent the duration of the stops

// Return value will be an encoded ds_list with the key/value 0 => -1 on error

var song, keyword, stopList, tmpArray, tmpList;
song = argument[0];
keyword = "#STOPS:";

tmpArray[0] = 0;
tmpList = ds_list_create();
stopList = libsm__readMetadata(song, keyword);
stopList += ","; //this is really hacky...

//Get the key=value pairs into an array
for (var i = 0; string_pos(",", stopList); i++) {
    var p = string_pos(",", stopList);
    tmpArray[i] = string_copy(stopList, 0, p - 1);
    stopList = string_delete(stopList, 1, p);
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
    var d = real(string_delete(tmpArray[i], 1, p));
    ds_list_insert(tmpList, m, d);
}

//Encode as string and such to prevent memory leaks
var list = ds_list_write(tmpList);
ds_list_destroy(tmpList);

return list;
