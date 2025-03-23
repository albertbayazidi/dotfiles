#import "@preview/ctheorems:1.1.3": *
#show: thmrules

#show: thmrules.with(qed-symbol: $square$)

#set page(width: 16cm, height: auto, margin: 1.5cm)
#set heading(numbering: "1.1.")

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#dbdcff"))

#let corollary = thmplain(
  "corollary",
  "Corollary",
  titlefmt: strong
)

#let lemma = thmbox("lemma", "Lemma", fill: rgb("#eeffee")) 

#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

