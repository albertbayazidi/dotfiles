// surfaceIntegrals
#let integralOmegaFun(function) = {
$integral_(Omega) function$
}

#let integralDomainFun(domain, function) = {
    $integral_(domain) function$
}

// surfaceIntegrals
#let surfaceIntegralOmegaFun(function) = {
$integral_(diff Omega) function$
}

#let surfaceIntegralDomainFun(domain, function) = {
$integral_(diff domain) function$
}

// innerproducts
#let innerPartialOmega(left,right) = $(left,right)_(partial Omega)$
#let innerOmega(left,right) = $(left , right)_(Omega)$ 
#let inner(left,right,space) = $(left , right)_(space)$
