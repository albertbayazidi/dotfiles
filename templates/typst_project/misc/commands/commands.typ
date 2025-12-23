// Norms
#let normSpace(func,space) = $norm(func)_space$
#let norm2Space(func,space) = $norm(func)^2_space$ 
#let normPowSpace(func,pow,space) = $norm(func)^(pow)_space$ 

#let normInf(func) = $norm(func)_oo$
#let normLInf(func) = $norm(func)_(L^(oo))$  

#let normOmega(func) = $norm(func)_Omega$
#let norm2Omega(func) = $norm(func)^2_Omega$

#let norm2L2(func) = $norm(func)^2_(L^2)$
#let norm2L2Omega(func) = $norm(func)^2_(L^2(Omega))$

// Functions
#let format-scientific(sci-string) = {
    let parts = sci-string.split("e")
    let significand = parts.at(0)
    let exponent = parts.at(1)

    return $#significand times 10^(#exponent)$
}

#let sqrt(func) = $func^(1/2)$
#let invSqrt(func) = $func^(-1/2)$
#let sqrtAbs(func) = $abs(func)^(1/2)$
#let invSqrtAbs(func) = $abs(func)^(-1/2)$

#let inv(func) = $(func)^(-1)$
#let invPow(func,exponent) = $(func)^(-exponent)$

#let seminorm(val) = $|val|$
#let seminormSpace(val,space) = $seminorm(val)_(space)$
