// supertable.typ
#import "table-state.typ": super-label-state, sub-auto-counter, super-supplement-state

#let supertable(
    body, 
    caption: none, 
    label: none, 
    cap-pos: bottom,      
    sub-cap-pos: bottom,
    kind: table,          
    supplement: "Table"  
  ) = {
  
  // 1. Update shared state so children match this type
  super-label-state.update(label)
  sub-auto-counter.update(0)
  super-supplement-state.update(supplement)

  // 2. Scope logic using the DYNAMIC kind
  show figure.where(kind: kind): parent => {
    set block(breakable: true)
    set figure.caption(position: cap-pos)
    
    show figure.where(kind: "subtable"): set figure.caption(position: sub-cap-pos)

    counter(figure.where(kind: "subtable")).update(0)
    
    // Numbering logic
    set figure(numbering: (..nums) => {
      // We look up the counter for the *specific kind* passed in
      let parent-nums = counter(figure.where(kind: kind)).at(parent.location())
      numbering("1a", ..parent-nums, ..nums)
    })

    // Caption logic
    show figure.caption: it => {
       (it.supplement + " " + it.counter.display(it.numbering) + it.separator)
       [ ]
       it.body
    }

    // Sub-caption logic
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

  // 3. Create the Main Figure
  let fig = figure(
    body,
    caption: caption,
    kind: kind,             // <--- Use the parameter
    supplement: supplement, // <--- Use the parameter
  )
  
  if label == none {
    fig
  } else {
    [#fig #label]
  }
}
