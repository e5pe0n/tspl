(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define compose
  (lambda (p1 p2)
    (lambda (x)
      (p1 (p2 x))
    )
  )
)
(define cadr
  (lambda (x)
    ((compose car cdr) x)
  )
)
(define cddr
  (lambda (x)
    ((compose cdr cdr) x)
  )
)

(print (cadr `(a b c))) ; b
(print (cddr `(a b c))) ; (c)