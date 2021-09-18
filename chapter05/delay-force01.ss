(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define stream-car
  (lambda (s)
    (car (force s))
  )
)
(define stream-cdr
  (lambda (s)
    (cdr (force s))
  )
)
(define counters
  (let next ([n 1])
    (delay (cons n (next (+ n 1))))
  )
)

(print
  (stream-car counters)
) ; 1
(print
  (stream-car counters)
) ; 1
(print
  (stream-car (stream-cdr counters))
) ; 2


(define stream-add
  (lambda (s1 s2)
    (delay (cons
      (+ (stream-car s1) (stream-car s2))
      (stream-add (stream-cdr s1) (stream-cdr s2))
    ))
  )
)
(define even-counters
  (stream-add counters counters)
)
(print
  (stream-car even-counters)
) ; 2
(print
  (stream-car (stream-cdr even-counters))
) ; 4