#lang sicp

; Ex 2.13

#|
Let interval a be c1 @ e1% tolerance
and interval b be c2 @ e2% tolerance
where c1 and c2 are the respective centers.

a: {c1 - (e1 x c1)/100, c1 + (e1 x c1)/ 100}
b: {c2 - (e2 x c2)/100, c2 + (e2 x c2)/ 100}

(mul-interval a b)
min: (lower-bound a) x (lower-bound b)
max: (upper-bound a) x (upper-bound b)

After expanding and simplifying, we will get the product
axb: {c1c2(1 - e1/100 - e2/100 + e1e2/10000),
      c1c2(1 + e1/100 + e2/100 + e1e2/10000)}

Since e1 and e2 are sufficiently small, e1e2/10000 ~= 0

Thus,
axb ~: {c1c2(1 - (e1/100 + e2/100)),
        c1c2(1 + (e1/100 + e2/100))}

Thus, the product is an interval with center c1c2
and percent intolerance of approx (e1 + e2)%. 

|#