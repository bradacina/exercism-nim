import strutils
var x = "abcdefghijklmn"
echo x.wordWrap(maxLineWidth=5, newLine=" ")