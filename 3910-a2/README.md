How to run the Program
------------------------
Place any dictionary files in the root directory, lower case only is most supported.
Type make, it will compile and execute the program.

To open a file simply enter the filename and extension, and providing its in the
root directory it will open. words.txt is the included dict and has 230K words randomly selected.

Known Issues
-------------------
None that I know Of

Limitations
-----------------------
240k word limit on the dictionary, built for the OSX dictionary file, will work with 230K and smaller lines
Reading in words with Capital letters might result in not being able to guess that word.
There is no exception handling for Files, if the file doesnt exist the program will Crash
