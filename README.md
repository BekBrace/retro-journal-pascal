# 🖥️ RetroJournal (1986)

A **retro-style terminal journal application written in Pascal**, inspired by old-school DOS programs and green-phosphor CRT screens.

RetroJournal lets you write personal journal entries, read them back, search through them, and view simple statistics — all wrapped in a nostalgic boot sequence straight out of the 1980s.

---

## ✨ Features

* 🟢 **Retro boot animation** with CRT-style green text
* ✍️ **Write journal entries** and save them to a text file
* 📖 **Read all previous entries** directly in the terminal
* 🔍 **Search entries** by keyword (case-insensitive)
* 📊 **Basic statistics** (line count & estimated word count)
* 💾 Uses a simple, human-readable `journal.txt` file

---

## 🧠 How It Works

* The program uses Pascal's `Text` file handling to store entries.
* Each entry is timestamped using `SysUtils.Now`.
* The `CRT` unit provides:

  * Screen clearing
  * Text colors
  * Delays
  * Keyboard input

Everything runs in a **single executable**, no databases, no dependencies — just pure Pascal.

---

## 📂 File Structure

```text
RetroJournal/
├── RetroJournal.pas   # Main program source code
└── journal.txt        # Auto-created journal storage file
```

> ⚠️ `journal.txt` is created automatically when you write your first entry.

---

## 🛠️ Requirements

* **Free Pascal Compiler (FPC)** or **Turbo Pascal compatible compiler**
* A terminal that supports ANSI colors (most modern terminals do)

---

## ▶️ Compile & Run

Using **Free Pascal**:

```bash
fpc RetroJournal.pas
./RetroJournal
```

On Windows:

```bat
fpc RetroJournal.pas
RetroJournal.exe
```

---

## 🧪 Program Menu

```text
========== RETRO JOURNAL 1986 ==========

1) Write a new entry
2) Read all entries
3) Search for a keyword
4) Show statistics
5) Exit
```

---

## 📜 Example Journal Entry

```text
=== ENTRY 21/01/2026 22:41:03 ===
Today I built a journal like it's 1986.
```

---

## 🎯 Educational Goals

This project is great for learning:

* Classic Pascal syntax
* Text file handling (`assign`, `reset`, `rewrite`, `append`)
* Basic string processing
* Procedural program structure
* Retro terminal UX concepts

---

## 🕰️ Philosophy

> No cloud. No sync. No AI.
> Just you, your thoughts, and a blinking cursor.

RetroJournal is intentionally simple — a reminder of when software felt personal, local, and honest.

---

## 📜 License

This project is released under the **MIT License**.
Feel free to fork, modify, and expand it.

---

## 👋 Final Words

Type slowly.
Save often.
And enjoy the glow of green text.

**Goodbye, Amir.**
