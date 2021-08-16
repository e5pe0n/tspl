(module mymod (hello greet print-x)
  (import scheme)
  (define (hello)
    (print-x "Hello, World, I'm in mymod!")
  )
  (define print-x
    (lambda (x)
      (for-each display `(,x "\n"))
    )
  )
  (define f
    (lambda (x) 1.0)
  )
  (define-syntax greet
    (syntax-rules ()
      [
        (_ g1 g2 ...)
        (print-x "Hello")
      ]
    )
  )
)
