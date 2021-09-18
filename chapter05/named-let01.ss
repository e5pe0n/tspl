(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define divisors
  (lambda (n)
    (let f ([i 2])
      (cond
        [(>= i n) `()]
        [(integer? (/ n i)) (cons i (f (+ i 1)))]
        [else (f (+ i 1))]
      )
    )
  )
)

(define divisors-tail-recursive
  (lambda (n)
    (let f ([i 2] [ls `()])
      (cond
        [(>= i n) ls]
        [(integer? (/ n i)) (f (+ i 1) (cons i ls))]
        [else (f (+ i 1) ls)]
      )
    )
  )
)

(print (divisors 5))  ; ()
(print (divisors 32)) ; (2 4 8 16)

(print (divisors-tail-recursive 5)) ; ()
(print (divisors-tail-recursive 32))  ; (16 8 4 2)