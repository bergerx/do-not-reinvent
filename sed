##### http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-printing-file-lines-using-address-and-patterns/

# Unix Sed Introduction
#     * sed is a “non-interactive” stream-oriented editor. Since its an “non-interactive” it can be used to automate editing if desired.
#     * The name sed is an abbreviation for stream editor, and the utility derives many of its commands from the ed line-editor (ed was the first UNIX text editor).
#     * This allows you to edit multiple files, or to perform common editing operations without ever having to open vi or emacs.
#     * sed reads from a file or from its standard input, and outputs to its standard output.
#     * sed has two buffers which are called pattern buffer and hold buffer. Both are initially empty.
# Unix Sed Working methodology
# This is called as one execution cycle. Cycle continues till end of file/input is reached.
#    1. Read a entire line from stdin/file.
#    2. Removes any trailing newline.
#    3. Places the line, in its pattern buffer.
#    4. Modify the pattern buffer according to the supplied commands.
#    5. Print the pattern buffer to stdout.


# sed -n option will not print anything, unless an explicit request to print is found.

# “p” command prints the buffer (remember to use -n option with “p”)
Sed Address Format:
 * NUMBER            sed -n 'Np' filename # print only Nth line
 * NUMBER1~NUMBER2   sed -n 'M~N'p filename # every Nth line starting from line M.
 * START,END         sed -n 'M,N'p filename # Mth line to Nth line
 * $                 sed -n '$'p filename # only the last line
 * NUMBER,$          sed -n 'N,$p' filename


Sed Pattern Format:
 * PATTERN              sed -n /PATTERN/p filename # prints only the line which matches the given pattern
 * /PATTERN/,ADDRESS    sed -n '/PATTERN/,Np' filename # prints lines which matches the pattern to Nth line
 * ADDRESS,/PATTERN/    sed -n 'N,/PATTERN/p' filename # from the Nth line of the input, to the line which matches the pattern
 * /PATTERN/,$          sed -n '/PATTERN/,$p' filename # prints from the line matches the given pattern to end of file
 * /PATTERN/,+N         sed -n '/PATTERN/,+Np' filename # prints the lines which matches the pattern and next N lines
 * /PATTERN/,/PATTERN/  sed -n '/P1/,/P2/p' filename # the section of file between two regular expression


# “d” command is just opposite, its for deletion. ‘d’ will delete the pattern space buffer and immediately starts the next cycle.
sed 'ADDRESS'd filename
sed /PATTERN/d filename

# The `s’ command attempts to match the pattern space against the supplied REGEXP; if the match is successful, then that portion of the pattern space which was matched is replaced with REPLACEMENT.
sed 'ADDRESSs/REGEXP/REPLACEMENT/FLAGS' filename
sed 'PATTERNs/REGEXP/REPLACEMENT/FLAGS' filename
#FLAGS can be any of the following
    * g Replace all the instance of REGEXP with REPLACEMENT
    * n Could be any number,replace nth instance of the REGEXP with REPLACEMENT.
    * p If substitution was made, then prints the new pattern space.
    * i match REGEXP in a case-insensitive manner.
    * w file If substitution was made, write out the result to the given file.
    * We can use different delimiters ( one of @ % ; : ) instead of /

#Sed provides “w” command to write the pattern space data to a new file.
sed 'ADDERSSw outputfile' inputfilename
sed '/PATTERN/w outputfile' inputfilename

# Sed provides the command “a” which appends a line after every line with the address or pattern.
sed 'ADDRESS a	Line which you want to append' filename
sed '/PATTERN/ a	Line which you want to append' filename

# Sed command “i” is used to insert a line before every line with the range or pattern.
sed 'ADDRESS i	Line which you want to insert' filename
sed '/PATTERN/ i	Line which you want to insert' filename

# “c” command in sed used to replace every line matches with the pattern or ranges with the new given line.
sed 'ADDRESS c	new line' filename
sed '/PATTERN/ c	new line' filename

# “=” is a command in sed to print the current line number to the standard output.
sed '=' filename


# Note:  -e option is optional for sed with single command. sed will execute the each set of command while processing input from the pattern buffer.
sed -e 'command' -e 'command' filename

sed -e '4d' -e '2d' thegeekstuff.txt # Delete 4th and 2nd line from the input
sed -n  -e '/Software/p'  -e '/Storage/p'  thegeekstuff.txt # Print the lines which matches the pattern1 and lines matches pattern2
sed -e '1d' -e '$d' -e '/^$/d' thegeekstuff.txt # Delete the first,last and all the blank lines from input



#### multileine sed http://stackoverflow.com/questions/1251999/sed-how-can-i-replace-a-newline-n
sed ':a;N;$!ba;s/\n/ /g'
printf "a\nb\nc\nd\ne\nf" | sed -E -e :a -e '$!N; s/\n/ /g; ta'

perl -i -p -e 's/\n//' file
