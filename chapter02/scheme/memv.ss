(define print
  (lambda (x)
    (for-each display `(,x, "\n"))
  )
)

(define memv
  (lambda (x ls)
    (cond
      [(null? ls) #f]
      [(eqv? x (car ls)) ls]
      [else (memv x (cdr ls))]
    )
  )
)

(print (memv `a `(a b b d)))
(print (memv `b `(a b b d)))
(print (memv `c `(a b b d)))
(print (memv `d `(a b b d)))
(print (if (memv `b `(a b b d)) "yes" "no"))

; (a b b d)
; (b b d)
; #f
; (d)
; yes