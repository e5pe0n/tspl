(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define (sum-of-squares x y)
  (+ (* x x) (* y y))
)
(print (sum-of-squares 3 4))  ; 25

(define f
  (lambda (x)
    (+ x 1)
  )
)
(print
  (let ([x 2])
    (define f
      (lambda (y)
        (+ y x)
      )
    )
    (f 3)
  )
) ; 5
(print (f 3)) ; 4

(define-syntax multi-define-syntax
  (syntax-rules ()
    [
      (_ (var expr) ...)
      (begin
        (define-syntax var expr)
        ...
      )
    ]
  )
)
(print
  (let ()
    (define plus
      (lambda (x y)
        (if (zero? x)
          y
          (plus (sub1 x) (add1 y))
        )
      )
    )
    (multi-define-syntax
      (add1 (syntax-rules () [(_ e) (+ e 1)]))
      (sub1 (syntax-rules () [(_ e) (- e 1)]))
    )
    (plus 7 8)
  )
) ; 15