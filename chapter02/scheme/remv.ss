(define print
  (lambda (x)
    (for-each display `(,x, "\n"))
  )
)

(define remv
  (lambda (x ls)
    (cond
      [(null? ls) `()]
      [(eqv? (car ls) x) (remv x (cdr ls))]
      [else (cons (car ls) (remv x (cdr ls)))]
    )
  )
)

(print (remv `a `(a b b d)))
(print (remv `b `(a b b d)))
(print (remv `c `(a b b d)))
(print (remv `d `(a b b d)))

; (b b d)
; (a d)
; (a b b d)
; (a b b)