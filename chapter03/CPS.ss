(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define implicit
  (lambda ()
    (letrec (
      [f (lambda (x) (cons 'a x))]
      [g (lambda (x) (cons 'b (f x)))]
      [h (lambda (x) (g (cons 'c x)))]
    )
      (cons 'd (h `()))
    )
  )
)

(define cps
  (lambda ()
    (letrec (
      [f (lambda (x k) (k (cons 'a x)))]
      [g (lambda (x k) (f x (lambda (v) (k (cons 'b v)))))]
      [h (lambda (x k) (g (cons 'c x) k))]
    )
      (h `() (lambda (v) (cons 'd v)))
    )
  )
)

(print (implicit))  ; (d b a c)
(print (cps)) ; (d b a c)