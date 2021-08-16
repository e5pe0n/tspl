(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define car&cdr
  (lambda (p k)
    (k (car p) (cdr p))
  )
)

(print
  (car&cdr `(a b c)
    (lambda (x y)
      (list y x)
    )
  )
)
(print
  (car&cdr `(a b c) cons)
)
(print
  (car&cdr `(a b c a d) memv)
)