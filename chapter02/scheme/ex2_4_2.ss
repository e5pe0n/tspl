(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)
(define f
  (lambda ()
    (let ([x 9])
      (* x
        (let ([x (/ x 3)])
          (+ x x)
        )
      )
    )
  )
)
(print (f)) ; 54