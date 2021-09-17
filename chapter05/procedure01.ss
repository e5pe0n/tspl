(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print (+ 3 4)) ; 7
(print ((if (odd? 3) + -) 6 2)) ; 8
(print ((lambda (x) x) 5))  ; 5
(print
  (let
    ([f (lambda (x) (+ x x))])
    (f 8)
  )
) ; 16