(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define-syntax _let
  (syntax-rules ()
    [(_ ((x e) ...) b1 b2 ...)
      ((lambda (x ...) b1 b2 ...) e ...)
    ]
  )
)

(print (_let ([x 5]) (+ x 1)))