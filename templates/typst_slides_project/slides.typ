#import "@preview/slydst:0.1.4": *

#show link: set text(fill: blue)
#show link: underline

#show: slides.with(
  title: "uke 38",
  subtitle: none,
  date: "16-09-2025", //fill with printf 20-08-2025 | xclip -selection clipboard  
  authors: ("Albert B",),
  layout: "medium",
  ratio: 4/3,
  title-color: none,
)

== Title 1
//#figure(image("figure.png", width: 60%), caption: "Caption")

#lorem(25)

== Title 2 
#grid(columns: (1.2fr, 1.5fr), gutter: 1em, 
  [
  #v(10%)
    - lamo
    - lmao 2
    - lmao 3
  ],
  [
    #figure(image("images/arch-nord-dark.png",width: 75%), caption: "logo")
  ])
  - lamo
  - lmao 2
  - lmao 3

#set align(left)

== Planen videre
  - lamo
  - lmao 2
  - lmao 3

== Q's 
  - lamo
  - lmao 2
  - lmao 3
