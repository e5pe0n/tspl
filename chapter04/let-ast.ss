(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (let* ([x (* 5.0 5.0)] [y (- x (* 4.0 4.0))])
    (sqrt y)
  )
) ; 3.0
(print
  (let ([x 0] [y 1])
    (let* ([x y] [y x])
      (list x y)
    )
  )
) ; (1 1)