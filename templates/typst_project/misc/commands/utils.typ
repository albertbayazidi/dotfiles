#import "commands.typ": *
#import "shortcuts.typ": *

// custom functionallty built ontop of typst
#let cross(func) = $cancel(func,stroke:#(red))$

#let highlighter(text) = {box(inset:1em, radius: 2pt, fill:yellow)[#text]}

