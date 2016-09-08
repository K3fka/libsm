///array libsm__getStops(string song)

// Returns a 2D array containing all Stop durations
// [x, 0] is the beat offset, and [x, 1] is the Stop duration

// Returns -1 on error

var song, keyword, stopList, tmpArray, tmpList, stopList;
song = argument[0];
keyword = "#STOPS:";

tmpArray[0] = 0;
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
    return -1;
}

//Split our pairs into a 2D array
for (var i = 0; i < array_length_1d(tmpArray); i++) {
    var p = string_pos("=", tmpArray[i]);
    var o = real(string_copy(tmpArray[i], 0, p - 1));
    var d = real(string_delete(tmpArray[i], 1, p));
    stopArray[i, 0] = o;
    stopArray[i, 1] = d;
}

return stopArray;
