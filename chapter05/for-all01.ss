(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (for-all symbol? `(a b c d))
)
(print
  (for-all =
    `(1 2 3 4)
    `(1.0 2.0 3.0 4.0)
  )
)
(print
  (for-all (lambda (x y z) (= (+ x y) z))
    `(1 2 3 4)
    `(1.2 2.3 3.4 4.5)
    `(2.2 4.3 6.5 8.5)
  )
)