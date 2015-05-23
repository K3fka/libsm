///int libsm__getFootRating(array songID, string chartType, string difficulty)

// Returns an integer representing the "foot rating" for a particular chart
// chartType will usually be "dance-single" or "dance-double"
// difficulty should be "Beginner", "Easy", "Medium", "Hard", "Challenging", or "Edit"
// More info here: http://www.stepmania.com/wiki/file-formats/sm (#NOTES section)

// Return value will be -1 on error

var songID, chartType, difficulty, file, rating;
songID = argument[0];
chartType = argument[1];
difficulty = argument[2];

file = file_text_open_read(songID[1]);

while(!file_text_eof(file)) {
    var line = file_text_readln(file);
    if (string_pos(chartType + ":", line)) {
        file_text_readln(file); //skip the "description" line
        line = file_text_readln(file);
        if (string_pos(difficulty + ":", line)) {
            rating = file_text_readln(file); //skip "foot rating" line
            }
        }
    }

rating = real(string_digits(rating));
if (rating) {
    return rating;
    } else {
    return -1;
    }
