(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define retry #f)

(define factorial
  (lambda (x k)
    (if (= x 0)
      (begin
        (set! retry k)
        (k 1)
      )
      (factorial (- x 1) (lambda (y) (k (* x y))))
    )
  )
)

(print
  (factorial 4 (lambda (x) x))
) ; 24
(print (retry 1)) ; 24
(print (retry 2)) ; 48