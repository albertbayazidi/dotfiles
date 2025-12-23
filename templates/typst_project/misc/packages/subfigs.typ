#let subfigure(body, caption: none, label: none, sub-cap-pos: auto) = {
  let fig = figure(
    body,
    kind: "subfigure", 
    supplement: "Figure", 
    caption: caption
  ) 
  if sub-cap-pos != auto {
    set figure.caption(position: sub-cap-pos)
    if label == none { fig } else { [#fig #label] }
  } else {
    if label == none { fig } else { [#fig #label] }
  }
}

// 2. The Superfigure function
#let superfigure(
    body, 
    caption: none, 
    label: none, 
    cap-pos: bottom,      
    sub-cap-pos: bottom,
    sub-numbering-offset: 0,
    increment-number: true // <--- NEW PARAMETER
  ) = {
  
  set figure.caption(position: cap-pos)

  show figure.where(kind: figure): parent => {
    
    show figure.where(kind: "subfigure"): set figure.caption(position: sub-cap-pos)

    counter(figure.where(kind: "subfigure")).update(sub-numbering-offset)
    
    set figure(numbering: (..nums) => {
      let parent-nums = counter(figure.where(kind: figure)).at(parent.location())
      numbering("1a", ..parent-nums, ..nums)
    })

    show figure.caption: it => {
       (it.supplement + " " + it.counter.display(it.numbering) + it.separator)
       [ ]
       it.body
    }

    show figure.where(kind: "subfigure"): child => {
      show figure.caption: it => context {
         let num = counter(figure.where(kind: "subfigure")).at(child.location()).first()
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
    kind: figure,
    supplement: "Figure",
  )
  
  // Combine label if needed
  let result = if label == none { fig } else { [#fig #label] }

  // LOGIC: If we shouldn't increment, we simply decrement the counter 
  // immediately before the figure is placed. 
  // (Counter - 1) + (Figure + 1) = Original Value.
  if not increment-number {
     counter(figure.where(kind: figure)).update(n => n - 1)
     result
  } else {
     result
  }
}

