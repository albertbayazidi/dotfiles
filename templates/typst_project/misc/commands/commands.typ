//constants
#let fASpace = $space forall space$

#let exSpace = $space exists space$

#let grad = $gradient$

#let dn = $diff_n$

//Spaces

#let lInf =$L^(infinity)$

#let lInfOmega = $L^(infinity)(Omega)$

#let l2 = $L^(2)$

#let l2Omega = $L^(2)(Omega)$

#let H1 = $H^1$ 

#let H1Omega = $H^1(Omega)$ 

#let H10 = $H^1_0(Omega)$

#let polynomialSapceElement = $PP^k (cal(T))$

#let discPolynomialSapceElement = $PP^k_"dc" (cal(T))$

#let discPolySpace = $PP^k_("dc") (cal(T))$ 

#let element = $cal(T)$

#let allElements = $T in #element$ 

#let facets = $cal(F)$ 

#let interiorFacets = $cal(F)^i$ 

#let boundryFacets = $cal(F)^b$ 

#let allInteriorFacets = $F in interiorFacets$

#let allBoundryFacets = $F in boundryFacets$

//functions
#let diffN(order, func, variable) = $(diff^(order) func )/(diff variable^order)$

#let Wspace(derivatives,bounded) = $W^(derivatives,bounded)$

#let inv(func) = $func^(-1)$

#let sqrt(func) = $func^(1/2)$

#let sqrtMinus(func) = $func^(-1/2)$

#let seminorm(val) = $|val|$

#let seminormSpace(val,space) = $seminorm(val)_(space)$

#let ran(space) = $"ran"(space)$

#let ker(space) = $"ker"(space)$

#let rank(operator) = $"rank"(operator)$

#let anilator(obj) = $obj^0$

#let preanilator(obj) = $obj_0$


//test problems
#let poissonProb = $ -laplace u &= f "in" Omega \ u &= u_D "on" diff Omega $

#let advectionReaction = $ cases(
  b dot grad u + c u = f in Omega,
  u = g "on" Gamma^-
) $



