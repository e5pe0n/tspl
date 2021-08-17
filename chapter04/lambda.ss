(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print ((lambda (x . y) (list x y)) 28 37)) ; (28 (37))
(print ((lambda (x . y) (list x y)) 28 37 47 28)) ; (28 (37 47 28))
(print ((lambda (x y . z) (list x y z)) 1 2 3 4)) ; (1 2 (3 4))
(print ((lambda x x) 7 13)) ; (7 13)