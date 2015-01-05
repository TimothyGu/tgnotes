# The TGNotes Text Format Specification
###### Version 0.0.0.alpha
###### Tiancheng "Timothy" Gu

## Background

The TGNotes Text Format is designed by me to fit in these contraints of daily
note taking:

1. Can be turned into pretty HTML
2. Looks moderately pretty in terminal
3. Looks OK when hand-written
4. Looks OK in a regular, proportional font text box without line wrapping,
   and understandable by a person who doesn't know any computer text syntax
5. Easy to type

Markdown, a text format very widely used in the GitHub, BitBucket, and email
worlds fits all these criteria but #4. Therefore I decided to base my format
on top of Markdown, with the additional benefit of not needing to write a
full-fledged TGNotes -> HTML renderer.

## Use

The TGNotes Text Format is used by me the author (T. "Timothy" Gu) for his
history notes. It is meant to fit in any kind of non-scientific (i.e. no
formulae) classes.

One TGNotes Document roughly corresponds to one chapter in the class.

## File Extension

The TGNotes Text Format does not define a file extension all Documents should
have, nor does reference implementation discriminate towards any specific file
extension. However it is recommended to have the Documents saved with a
`.tgnotes` file extension for easy identification. `.txt` file extension would
work as well. It is not recommended to use `.md` or `.markdown` as the file
extension, even though the TGNotes File Format is compiled to the Markdown
format.

## MIME Types

No MIME types for Documents are defined at this moment.

## Common Definitions

- `<tab>`: the horizontal tab character "	", or, in C escaping notation, `\t`
- "Document": one file that is recognized as being of the TGNotes Text Format
- "Capitalized": the text is capitalized according to the Associated Press
  style, which specifies the following be capitalized [1]:
  - The first word
  - The last word
  - All words with three letters or fewer and is not a noun, a pronoun, a
    verb, an adverb, an adjective, or a subordinating conjunction.
- "Indent": the action of typing `<tab>` characters before the first character
  of the line.
  - "Level of Indentation": the number of `<tab>` characters used in
    indenting.

[1]: “Composition Titles,” AP Stylebook, Online Edition, 2011. (accessed June
     7, 2011).

## Line Breaks and Line Wrapping

Line breaks or line wrapping is not encouraged nor discouraged.

However, more than one consecutive line break is not allowed within a
Paragraph or inside an inline element.

## Title of the Document

All documents start with a "Chapter". Format is specified below:

    Chapter <number>: <title>

Where <number> represents a number and <title> represents a string
representing the title.

## Section Headings

Section headings are classified as headings within a chapter. The format for
a Section heading is below:

    <Roman numeral>.<tab><heading>

- `<Roman numeral>`: a Roman numeral representing the <word I'm looking for>
	of the section, up to "MMMMCMXCIX", or 4999.
- `<heading>`: the heading of the Section, properly Capitalized

## Subsection Headings

Subsection headings are used for parts within a Section. The format for a
Subsection heading is below:

    <tab><English letter numeral>.<tab><heading>

- `<English letter numeral>`: a numeral composed of English alphabet,
  representing the <word I'm looking for> of the Subsection. For example,
  `<tab>A.<tab>` represents the first Subsection of the Section,
  `<tab>Z.<tab>` the twenty-sixth, and `<tab>DC.<tab> the 107th. No upper
  limit is defined in this version of the specification.
- `<heading>`: the heading of the Subsection, properly Capitalized

## Paragraphs

Paragraphs have the same format as Markdown, with one exception: it must be
Indented to the level of the heading **directly** under which the Paragraph
lies, plus 1, for readability. See the following table for the exact
Indentation level to be used:

Heading    | Level of Indentation
-----------| --------------------
Title      | 1
Section    | 1
Subsection | 2

## Code blocks

Both the GitHub-flavored Markdown and standard Markdown syntaxes shall be
valid, but depend on the Markdown interpreter used, with one exception:
It shall be Indented to the same level as a Paragraph would be, with <tab>
character(s), and no <tab> characters shall be allowed inside the code block.

## Other Block-Level Elements

All other block-level elements follow the Markdown standard, but must be
Indented correctly as a paragraph would be. A list of block-level elements
supported is dependent on the Markdown interpreter used.

## Other Inline elements

All other elements follow the Markdown standard, including but not limit to:

- **strong**
- *emphasized*
- __underlined__
- `preformatted`

## Example

The following is an example of a valid Document. Note that you might have to
open the file manually to examine the use of the `<tab>` character.

```
Chapter 18: The Atlantic System and Africa

I.	First Section
	Plantations in the West Indies first started out to be successful tobacco
	growers. Note how this Paragraph is wrapped at column 78, assuming your
  editor is set up to have a tab width of 2 spaces.
	A.	Colonization Before 1650
		This is the description of the first Subsection of the first Section of the Document. Note it is not wrapped.

		**DO NOT MIX WRAPPED TEXT AND NON-WRAPPED TEXT IN A DOCUMENT!** The text
		on the left is marked as strong text.
	B.	Sugar and Slaves
		The Dutch expertise in the Caribbean made the English and French colonies
		(especially Barbados) the richest in the New World.

II. Second Section
	A.	Technology and Environment
		It is often *more profitable* to control one large sugar plantation than
		several smaller plantations.
	B.	Slaves' Lives
		In ordinary days field slaves are organized into "gangs" with only the
		youngest, oldest, and sickest not out for work.
	C.	Free Whites and Free Blacks
		Most free whites did not live in Jamaica, and were not the top 1%
		population, but also owned slaves.
```

## Reference Implementation

The following is a reference implementation of the TGNotes Text Format. It is
written using Unix Shell and Sed, and compiles a TGNotes document to a
Markdown document.

```sh
#!/bin/sh
#
# Script that converts TGNotes documents to Markdown
#
# Copyright © 2014 Tiancheng "Timothy" Gu
# Licensed under the MIT License.

# This script is only tested on GNU Sed.

# Usage: <this file> <input.tgnotes> [<output.md>]
# If the out put file is not specified it is assumed to be the basename (i.e.
# name without any file extensions)

if [ "$#" -lt "1" ] || [ "$#" -gt "2" ]; then
    echo "Incorrect command syntax" >&2
    exit 1
else
    in=$1
    if [ "$#" -eq "2" ]; then
        out=$2
    else
        out=${2%%.*}
    fi
fi

sed -r -e 's/^(Chapter)/\# \1/g'             \
       -e 's/^([IVXLCDM]+\.)\t/\#\# \1 /g'   \
       -e 's/^\t([A-Z]+\.)\t/\n\#\#\# \1 /g' \
       -e 's/\t//g'                          \
       $in > $out
```

## About This Document

This document is written in GitHub-flavored Markdown, suitable to be processed
with the Redcarpet Markdown renderer (the default on GitHub).
