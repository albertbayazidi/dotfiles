#import "integrals.typ": * 
#import "commands.typ": *
#import "shortcuts.typ": *


// formulations
#let centralFlux1 = {
$
a(u,v)^("cf") &= innerOmega(#b dot grad u,v)
+ innerOmega(c u,v)
- inner(#b dot n u,v,Gamma^-)
- inner(#b dot n [u],{w},interiorFacets) \
$}
#let centralFlux2 = {
$
a(u,v)^("cf") = -innerOmega(u,#b dot grad v)
+ innerOmega((c - grad dot #b) u,v) + inner(#b dot n u,v,Gamma^+)
- inner(#b dot n {u},[v],interiorFacets)
$}

#let centralFluxRHS =$ innerOmega(f,v) - inner(#b dot n g,v,Gamma^-) $

// custom functionallty built ontop of typst
#let cLink(dest, content) = link(dest)[($content$)] //inccorect error message

#let cross(func) = $cancel(func,stroke:#(red))$


// Norms

#let normSpace(func,space) = $norm(func)_space$

#let normPowSpace(func,pow,space) = $norm(func)^(pow)_space$ 

#let norm2Space(func,space) = $norm(func)_space^2$ 

#let normInf(func) = $norm(func)_oo$

#let normLInf(func) = $norm(func)_(lInfOmega)$  

#let normOmega(func) = $norm(func)_Omega$

#let norm2Omega(func) = $norm(func)_Omega^2$

#let norm2L2(func) = $norm(func)_l2^2$

#let norm2L2Omega(func) = $norm(func)_l2Omega^2$

#let sqAbs(func) = $abs(func)^(1/2)$

#let invSqAbs(func) = $abs(func)^(-1/2)$

#let dualParingSpace(func1,func2,space1,space2) = $angle.l func1 , func2 angle.r_(space1,space2) $


#let dualParing(func1,func2) = $angle.l func1 , func2 angle.r $













