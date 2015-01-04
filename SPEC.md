# TGNotes Format Specification
###### Version 0.0.1

## Common Definitions

- `<tab>`: the horizontal tab character "	", or "\t"
- "Capitalized": the text is capitalized according to the Associated Press
  style, which specifies the following be capitalized [1]:
  - The first word
  - The last word
  - All words with three letters or fewer and is not a noun, a pronoun, a
    verb, an adverb, an adjective, or a subordinating conjection.

[1]: “Composition Titles,” AP Stylebook, Online Edition, 2011. (accessed June
     7, 2011).

## Title of the document

All documents start with a "Chapter". Format is specified below:

    Chapter <number>: <title>

Where <number> represents a number and <title> represents a string
representing the title.

## Section Headings

Section headings are classified as headings within a chapter. The format for
a Section heading is below:

    <Roman numeral>.<tab><heading>

- `<Roman numeral>`: a Roman numeral representing the <word I'm looking for> of the
section, up to "MMMMCMXCIX", or 4999.
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
indented to the level of the heading **directly** under which the Paragraph
lies, plus 1, for readability. See the following table for the exact
indentation level to be used:

Heading    | Level of indentation
-----------| --------------------
Title      | 1
Section    | 1
Subsection | 2

## Code blocks

Both the GitHub-flavored Markdown and standard Markdown syntaxes shall be
valid, but depend on the Markdown interpreter used, with one exception:
It shall be indented to the same level as a Paragraph would be, with <tab>
character(s), and no <tab> characters shall be allowed inside the code block.

## Other elements

All other elements follow the Markdown standard, including but not limit to:

- Table format (Markdown implementation-defined)
- Inline style, such as **strong**, *emphasized*, __underlined__, or
  `preformatted` text.

