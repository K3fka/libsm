/// consoleLog(expression1, expression2, ...)
var r = string(argument[0]), i;
for (i = 1; i < argument_count; i++) {
    r += ", " + string(argument[i]);
}
show_debug_message(r);