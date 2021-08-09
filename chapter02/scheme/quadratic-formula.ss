(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define quadratic-formula
  (lambda (a b c)
    (let ([minusb (- 0 b)]
          [radical (sqrt (- (* b b) (* 4 (* a c))))]
          [divisor (* 2 a)])
      (let ([root1 (/ (+ minusb radical) divisor)]
            [root2 (/ (- minusb radical) divisor)])
        (cons root1 root2)
      )
    )
  )
)

(print (quadratic-formula 2 -4 -6)) ; (3 . -1)