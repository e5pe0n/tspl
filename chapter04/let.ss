(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (let ([x (* 3.0 3.0)] [y (* 4.0 4.0)])
    (sqrt (+ x y))
  )
) ; 5.0
(print
  (let ([x 'a] [y `(b c)])
    (cons x y)
  )
) ; (a b c)
(print
  (let ([x 0] [y 1])
    (let ([x y] [y x])
      (list x y)
    )
  )
) ; (1 0)