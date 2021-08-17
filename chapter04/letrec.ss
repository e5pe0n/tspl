(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (letrec ([sum (lambda (x)
    (if (zero? x)
      0
      (+ x (sum (- x 1)))
    )
    )])
    (sum 5)
  )
) ; 15