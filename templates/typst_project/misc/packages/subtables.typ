#let super-label-state = state("super-label", none)
#let sub-auto-counter = counter("sub-auto-counter")

#let subtable(body, caption: none, label: none, sub-cap-pos: auto) = context {
  // A. Determine the Label
  let final-label = label
  
  if final-label == none {
    let super-lbl = super-label-state.get()
    // Only generate if parent has a label
    if super-lbl != none {
       // Get current count (e.g., 0) and look ahead to next (e.g., 1)
       let idx = sub-auto-counter.get().first() + 1
       let suffix = numbering("a", idx) // 1 -> "a"
       final-label = std.label(str(super-lbl) + "-" + suffix)
    }
  }

  // B. Emit the counter update for the NEXT subtable
  sub-auto-counter.step()

  // C. Build the Figure
  let fig = figure(
    body,
    kind: "subtable", 
    supplement: "Table", 
    caption: caption
  ) 
  
  let result = if sub-cap-pos != auto {
    set figure.caption(position: sub-cap-pos)
    fig
  } else {
    fig
  }

  // D. Return Figure with Label attached
  if final-label != none {
    [#result #final-label]
  } else {
    result
  }
}

// 2. The Supertable function
#let supertable(
    body, 
    caption: none, 
    label: none, 
    cap-pos: bottom,      
    sub-cap-pos: bottom,
  ) = {
  
  // 1. Update the state so children know the parent label
  super-label-state.update(label)
  // 2. Reset the label counter to 0 for this new table
  sub-auto-counter.update(0)

  show figure.where(kind: table): parent => {
    set block(breakable: true)

    set figure.caption(position: cap-pos)
    show figure.where(kind: "subtable"): set figure.caption(position: sub-cap-pos)

    counter(figure.where(kind: "subtable")).update(0)
    
    set figure(numbering: (..nums) => {
      let parent-nums = counter(figure.where(kind: table)).at(parent.location())
      numbering("1a", ..parent-nums, ..nums)
    })

    show figure.caption: it => {
       (it.supplement + " " + it.counter.display(it.numbering) + it.separator)
       [ ]
       it.body
    }

    show figure.where(kind: "subtable"): child => {
      show figure.caption: it => context {
         let num = counter(figure.where(kind: "subtable")).at(child.location()).first()
         (numbering("(a)", num))
         [ ]
         it.body
      }
      child
    }

    parent
  }

  let fig = figure(
    body,
    caption: caption,
    kind: table,
    supplement: "Table",
  )
  
  if label == none {
    fig
  } else {
    [#fig #label]
  }
}
