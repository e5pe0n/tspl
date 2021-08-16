(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define retry #f)

(define factorial
  (lambda (x)
    (let f ([x x] [k (lambda (x) x)])
      (if (= x 0)
        (begin
          (set! retry k)
          (k 1)
        )
        (f (- x 1) (lambda (y) (k (* x y))))
      )
    )
  )
)

(print (factorial 4)) ; 24
(print (retry 1)) ; 24
(print (retry 2)) ; 48