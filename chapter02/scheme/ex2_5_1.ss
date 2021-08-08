(define A
  (lambda ()
    (let ([f (lambda (x) x)])
      (f 'a)
    )
  )
)
(define B
  (lambda ()
    (let ([f (lambda x x)])
      (f 'a)
    )
  )
)
(define C
  (lambda ()
    (let ([f (lambda (x . y) x)])
      (f 'a)
    )
  )
)
(define D
  (lambda ()
    (let ([f (lambda (x . y) y)])
      (f 'a)
    )
  )
)

(print (A)) ; a
(print (B)) ; (a)
(print (C)) ; a
(print (D)) ; ()