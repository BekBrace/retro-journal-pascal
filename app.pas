program RetroJournal;

// We import the CRT unit to control screen colors, cursor, delays, etc.
// The CRT unit gives old-school terminal effects (colors, clearing the screen,
// cursor control, blinking text, etc.).
uses crt, SysUtils;

// We define the file name where journal entries will be saved.
const
    JOURNAL_FILE = 'journal.txt';


// -----------------------------------------------------------
// PROCEDURE: BootAnimation
// Shows a fake retro boot-up animation before the menu appears.
// -----------------------------------------------------------
procedure BootAnimation;
begin
    clrscr;                // Clear the screen to start clean.
    textcolor(lightgreen); // Set text color to green (retro phosphor style).

    writeln('[BOOTING JOURNAL SYSTEM 1986...]');
    delay(700);            // Pause for 0.7 seconds for effect.

    writeln('[CHECKING MEMORY........OK]');
    delay(500);

    writeln('[LOADING MODULES.........OK]');
    delay(500);

    writeln('[INITIALIZING TERMINAL....OK]');
    delay(500);

    writeln;
    writeln('[SYSTEM READY]');
    delay(600);

    writeln;
    writeln('Press any key to continue...');
    readkey;               // Wait for a key before continuing.
    clrscr;
end;


// -----------------------------------------------------------
// PROCEDURE: WriteEntry
// Lets the user type a journal entry and saves it to a file.
// -----------------------------------------------------------
procedure WriteEntry;
var
    f: Text;              // A text file variable.
    entry: string;        // Will hold the user's journal input.
begin
    clrscr;
    textcolor(lightgreen);
    writeln('--- NEW JOURNAL ENTRY ---');
    writeln;

    writeln('Type your journal entry (single line).');
    writeln('Press ENTER when done.');
    writeln;

    write('> ');
    readln(entry);         // Read the user’s input text.

    // Now we prepare to save this entry to our file.
    assign(f, JOURNAL_FILE);  

    // Attempt to append, but create file if it doesn't exist
    {$I-}
    append(f);     
    {$I+}

    if IOResult <> 0 then
    begin
        rewrite(f);  // Create the file from scratch
    end;

    // Write a timestamp and the entry.
    writeln(f, '=== ENTRY ', DateTimeToStr(Now), ' ===');
    writeln(f, entry);
    writeln(f);               // Blank line for readability.

    close(f);                 // ALWAYS close files when done.

    writeln;
    writeln('Entry saved successfully!');
    writeln('Press any key to return to the menu...');
    readkey;
end;


// -----------------------------------------------------------
// PROCEDURE: ReadEntries
// Displays the entire journal file to the screen.
// -----------------------------------------------------------
procedure ReadEntries;
var
    f: Text;
    line: string;
begin
    clrscr;
    textcolor(lightgreen);
    writeln('--- READING JOURNAL ENTRIES ---');
    writeln;

    assign(f, JOURNAL_FILE);   // Link variable "f" to the file.

    // Check if the file exists
    {$I-}                      // Turn off automatic error handling
    reset(f);                  // Try to open file for reading
    {$I+}                      // Restore error handling

    if IOResult <> 0 then      // If file couldn’t open, IOResult is not 0
    begin
        writeln('No journal file exists yet.');
        writeln('Press any key to return...');
        readkey;
        exit;
    end;

    // Read and display each line of the file
    while not eof(f) do        // Loop until we reach end of file
    begin
        readln(f, line);       // Read one line from the file
        writeln(line);         // Print it to screen
    end;

    close(f);                  // Close file when done

    writeln;
    writeln('--- END OF JOURNAL ---');
    writeln('Press any key to return...');
    readkey;
end;


// -----------------------------------------------------------
// PROCEDURE: SearchEntries
// Search for a keyword inside the journal file.
// -----------------------------------------------------------
procedure SearchEntries;
var
    f: Text;
    line, keyword: string;
    found: integer;
begin
    clrscr;
    textcolor(lightgreen);

    writeln('--- SEARCH JOURNAL ---');
    writeln;
    write('Enter keyword: ');
    readln(keyword);

    assign(f, JOURNAL_FILE);

    {$I-}
    reset(f);
    {$I+}

    if IOResult <> 0 then
    begin
        writeln('No journal file found.');
        writeln('Press any key to return...');
        readkey;
        exit;
    end;

    found := 0;                // Counter for how many lines contain the keyword

    while not eof(f) do
    begin
        readln(f, line);

        // "pos" checks if keyword exists in the line
        if pos(lowercase(keyword), lowercase(line)) > 0 then
            inc(found);        // Increase count if found
    end;

    close(f);

    writeln;
    writeln('The word "', keyword, '" was found in ', found, ' lines.');
    writeln;
    writeln('Press any key to return...');
    readkey;
end;


// -----------------------------------------------------------
// PROCEDURE: ShowStats
// Very simple stats: count how many lines, how many words, etc.
// -----------------------------------------------------------
procedure ShowStats;
var
    f: Text;
    line: string;
    lineCount, wordCount: integer;
    i: integer;
begin
    clrscr;
    textcolor(lightgreen);

    writeln('--- JOURNAL STATISTICS ---');
    writeln;

    assign(f, JOURNAL_FILE);

    {$I-}
    reset(f);
    {$I+}

    if IOResult <> 0 then
    begin
        writeln('No journal file found.');
        writeln('Press any key to return...');
        readkey;
        exit;
    end;

    lineCount := 0;
    wordCount := 0;

    // Count basic stats
    while not eof(f) do
    begin
        readln(f, line);
        inc(lineCount);

        // Count spaces to estimate number of words.
        for i := 1 to length(line) do
            if line[i] = ' ' then
                inc(wordCount);

        // Add one word per line (minimum)
        inc(wordCount);
    end;

    close(f);

    writeln('Total lines: ', lineCount);
    writeln('Estimated word count: ', wordCount);
    writeln;

    writeln('Press any key to return...');
    readkey;
end;


// -----------------------------------------------------------
// MAIN PROGRAM
// Displays menu and runs user choices.
// -----------------------------------------------------------
var
    choice: integer;
begin
    BootAnimation; // Show retro boot screen first

    repeat
        clrscr;
        textcolor(lightgreen);

        writeln('========== RETRO JOURNAL 1986 ==========');
        writeln;
        writeln('1) Write a new entry');
        writeln('2) Read all entries');
        writeln('3) Search for a keyword');
        writeln('4) Show statistics');
        writeln('5) Exit');
        writeln;
        write('Choose an option (1-5): ');
        readln(choice);

        case choice of
            1: WriteEntry;
            2: ReadEntries;
            3: SearchEntries;
            4: ShowStats;
        end;

    until choice = 5;  // Loop until user chooses to exit

    clrscr;
    writeln('Shutting down...');
    delay(500);
    writeln('Goodbye Amir.');
    delay(700);
end.

