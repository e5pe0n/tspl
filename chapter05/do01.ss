(define print
  (lambda (x)
    (for-each display `(,x, "\n"))
  )
)

(define factorial
  (lambda (n)
    (do ([i n (- i 1)] [a 1 (* a i)])
      ((zero? i) a)
    )
  )
)
(print (factorial 10))  ; 3628800

(define fibonacci
  (lambda (n)
    (if (= n 0)
      0
      (do ([i n (- i 1)] [a1 1 (+ a1 a2)] [a2 0 a1])
        ((= i 1) a1)
      )
    )
  )
)
(print (fibonacci 6)) ; 8

(define divisors
  (lambda (n)
    (do
      (
        [i 2 (+ i 1)]
        [ls `()
          (if (integer? (/ n i))
            (cons i ls)
            ls)]
      )
      ((>= i n) ls)
    )
  )
)

(define scale-vector!
  (lambda (v k)
    (let ([n (vector-length v)])
      (do ([i 0 (+ i 1)])
        ((= i n))
        (vector-set! v i (* (vector-ref v i) k))
      )
    )
  )
)
(define vec (vector 1 2 3 4 5))
(scale-vector! vec 2)
(print vec) ; #(2 4 6 8 10)