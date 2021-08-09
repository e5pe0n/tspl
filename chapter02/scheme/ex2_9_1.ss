(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define make-counter
  (lambda (init step)
    (let ([next init])
      (lambda ()
        (let ([v next])
          (set! next (+ next step))
          v
        )
      )
    )
  )
)

(define c1 (make-counter 0 1))
(define c2 (make-counter -10 5))

(print (c1))  ; 0
(print (c2))  ; -10
(print (c1))  ; 1
(print (c1))  ; 2
(print (c2))  ; -5
(print (c2))  ; 0