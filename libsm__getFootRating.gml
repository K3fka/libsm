///int libsm__getFootRating(string song, string chartType, string difficulty)

// Returns an integer representing the "foot rating" for a particular chart
// chartType will usually be "dance-single" or "dance-double"
// difficulty should be "Beginner", "Easy", "Medium", "Hard", "Challenging", or "Edit"
// More info here: http://www.stepmania.com/wiki/file-formats/sm (#NOTES section)

// Return value will be -1 on error

var song, chartType, difficulty, file, rating;
song = argument[0];
chartType = argument[1];
difficulty = argument[2];

while (string_pos(chartType + ":", song)) {
    song = string_delete(song, 1, string_pos(chartType + ":", song));
    song = string_delete(song, 1, string_pos(chr(10), song)); //skip "description" line
    if (string_pos(difficulty + ":", song) < string_pos(";", song)) {
        repeat (2) {
            song = string_delete(song, 1, string_pos(chr(10), song));
        }
        rating = string_copy(song, 1, string_pos(":", song));
    }
}

rating = real(string_digits(rating));
if (rating) {
    return rating;
} else {
    return -1;
}
