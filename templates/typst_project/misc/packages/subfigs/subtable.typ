#import "table-state.typ": super-label-state, sub-auto-counter, super-supplement-state

#let subtable(body, caption: none, label: none, sub-cap-pos: auto) = context {
  
  // 1. Get the parent supplement (Table vs Figure)
  let my-supplement = super-supplement-state.get()

  // 2. Determine the Label (Same as before)
  let final-label = label
  if final-label == none {
    let super-lbl = super-label-state.get()
    if super-lbl != none {
       let idx = sub-auto-counter.get().first() + 1
       let suffix = numbering("a", idx)
       final-label = std.label(str(super-lbl) + "-" + suffix)
    }
  }

  // 3. Increment Counter
  sub-auto-counter.step()

  // 4. Build Figure using the dynamic supplement
  let fig = figure(
    body,
    kind: "subtable", 
    supplement: my-supplement, // <--- Dynamic now
    caption: caption
  ) 
  
  let result = if sub-cap-pos != auto {
    set figure.caption(position: sub-cap-pos)
    fig
  } else {
    fig
  }

  if final-label != none {
    [#result #final-label]
  } else {
    result
  }
}
