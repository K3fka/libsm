///array libsm__getBPMs(string song)

// Returns a 2D array containing all BPM values
// [x, 0] is the beat offset, and [x, 1] is the BPM value

// Returns -1 on error

var song, keyword, bpmArray, tmpArray, tmpList, bpmList;
song = argument[0];
keyword = "#BPMS:";

tmpArray[0] = 0;
bpmList = libsm__readMetadata(song, keyword);
bpmList += ","; //this is really hacky...

//Get the key=value pairs into an array
for (var i = 0; string_pos(",", bpmList); i++) {
    var p = string_pos(",", bpmList);
    tmpArray[i] = string_copy(bpmList, 0, p - 1);
    bpmList = string_delete(bpmList, 1, p);
}

//Error handling
if (tmpArray[0] == "0") {
    return -1;
}

//Split our pairs into a 2D array
for (var i = 0; i < array_length_1d(tmpArray); i++) {
    var p = string_pos("=", tmpArray[i]);
    var o = real(string_copy(tmpArray[i], 0, p - 1));
    var b = real(string_delete(tmpArray[i], 1, p));
    bpmArray[i, 0] = o;
    bpmArray[i, 1] = b;
}

return bpmArray;
