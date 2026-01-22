----------------
Rewritten Script
----------------
Hey, what’s going on guys — hope you’re doing well.
First of all, happy New Year, merry Christmas, and happy holidays to everyone watching this.
The last few years haven’t exactly been gentle with the world, so yeah… let’s hope this year is calmer, smarter, and maybe a bit more human.

Now.

Today I want to show you something a little different — something simple, honest, and honestly… kind of beautiful.

We’re going to build a retro journal application in Pascal.
Text-only. Terminal-based. No frameworks. No cloud. No AI copilots whispering in your ear.

Just you, the keyboard, and the machine.

And I know — everywhere you look right now, you hear that programming is “done”, that AI is replacing developers, that coding jobs are disappearing.
But if you’ve ever fallen in love with programming because it felt good — because you made something move, something react — then this video is for you.

Pascal has a way of reminding you why you started.
===========================================================================================

--------------------
Setting expectations
--------------------

Here’s what we’re going to do in this video:

First, I’ll run the program, so you can see what we’re building.

Then we’ll walk through the code step by step.

I’ll explain why each part exists — not just what it does.

No rush. No magic. Just clarity.

Environment transition

For this demo, I’m using Windows Subsystem for Linux — WSL2.

If you’re on Windows and you don’t have WSL yet, don’t worry — I’ll leave a link in the description to a simple guide that walks you through the installation step by step.

Alright — let’s run the program first.

Demo transition (very important)

So when we launch it, the first thing you’ll notice is this fake retro boot screen.

This isn’t here by accident.

Back in the 80s and early 90s, software announced itself.
It took its time. It made you feel like a system was waking up.

And that’s exactly the atmosphere I wanted.

[run BootAnimation]

From here, we land in a simple menu:

Write a new journal entry

Read existing entries

Search for a keyword

Show basic statistics

Everything is stored in a plain text file.
No database. No abstraction. You can literally open the file and read your thoughts.

And honestly… that’s kind of refreshing.
===========================================================================================

--------------------
Transition into code
--------------------
Now that you’ve seen what the program does, let’s look at how it’s built.

I’ll start from the top and explain things line by line — because Pascal shines when you read it slowly.

Code explanation flow (guidance for you while recording)

When you switch to code, your narration can flow like this:

Program declaration
“This is where everything starts. Pascal is very explicit — it tells you upfront what this program is.”

uses crt, SysUtils
Explain CRT as the soul of the retro feeling: colors, cursor, delays.
SysUtils for time and file handling.

Constants
Why having JOURNAL_FILE as a constant matters — clarity and intent.

Procedures
Emphasize how Pascal forces good structure:

BootAnimation → presentation

WriteEntry → input + persistence

ReadEntries → output

SearchEntries → logic

ShowStats → simple analysis

File handling
This is gold for teaching:

assign

reset, rewrite, append

IOResult

Tell people: this is what programming used to look like — and it still makes sense.

Main loop
Show how the menu is just logic + discipline.
No magic. No hidden behavior.

Closing philosophy (optional but powerful)

And that's it guys, thank you so much for watching till the end.

Programming isn’t dead.
It’s just buried under noise.
Sometimes, going backward — using an old language, a simple terminal — reminds you what mattered in the first place.
If you enjoyed this, like the video, subscribe, and let me know if you want more retro projects like this.
Next time, we might push it even further.
