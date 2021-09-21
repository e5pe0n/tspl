(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (let ([f (lambda (x) (+ x 1))])
    (let-syntax
      (
      [
        f (syntax-rules ()
          [(_ x) x]
        )
      ]
      [
        g (syntax-rules ()
          [(_ x) (f x)]
        )
      ]
      )
      (list (f 1) (g 1))
    )
  )
) ; (1 2)
(print
  (let ([f (lambda (x) (+ x 1))])
    (letrec-syntax
      (
        [
          f (syntax-rules ()
            [(_ x) x]
          )
        ]
        [
          g (syntax-rules ()
            [(_ x) (f x)]
          )
        ]
      )
      (list (f 1) (g 1))
    )
  )
) ; (1 1)