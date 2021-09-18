(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (map abs `(1 -2 3 -4 5 -6))
)
(print
  (map (lambda (x y) (* x y)) `(1 2 3 4) `(8 7 6 5))
)