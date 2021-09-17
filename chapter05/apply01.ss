(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print (apply + `(4 5)))  ; 9
(print (apply min `(6 8 3 2 5)))  ; 2
(print (apply min 5 1 3 `(6 8 3 2 5)))  ; 1
(print (apply vector 'a 'b `(c d e))) ; #(a b c d e)

(define first
  (lambda (ls)
    (apply (lambda (x . y) x) ls)
  )
)
(define rest
  (lambda (ls)
    (apply (lambda (x . y) y) ls)
  )
)
(print (first `(a b c d)))  ; a
(print (rest `(a b c d))) ; (b c d)

(print
  (apply
      append
      `(1 2 3)
      `((a b) (c d e) (f))
  )
)
