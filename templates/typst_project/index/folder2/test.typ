#import "../../misc/commands/utils.typ": * 
#import "../../misc/packages/packages.typ": *

#supertable(
  caption: [my first table],
  label: <mainLabel>,
  sub-cap-pos: bottom,
  cap-pos: top,
  kind: figure,          
  supplement: "Table",
  grid(
    columns: 1,
    gutter: 1.0em,
    subtable(
      rect(width: 62%,radius:1em,height: 15%,fill: aqua),
      caption: [lmao]
    ),
    subtable(
      rect(width: 100%,radius:1em,height: 15%,fill: aqua),
      caption: [lmao]

    ),
    subtable(
      rect(width: 100%,radius:1em,height: 28%,fill: aqua),
      caption: [lmao]
    ),
  )
)

@mainLabel-a
@mainLabel-b
@mainLabel-c

