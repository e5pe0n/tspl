(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define make-stack
  (lambda (n)
    (let ([vec (make-vector n)] [idx 0])
      (lambda (msg . args)
        (case msg
          [(empty? mt?) (= idx 0)]
          [(push!) (begin
            (vector-set! vec idx (car args))
            (set! idx (+ idx 1)))
          ]
          [(top) (vector-ref vec (- idx 1))]
          [(pop!) (begin
            (set! idx (- idx 1))
            (vector-ref vec (+ idx 1))
          )]
          [(ref) (vector-ref vec (- (- idx 1) (car args)))]
          [(set!) (vector-set! vec (car args) (cadr args))]
          [else "oops"]
        )
      )
    )
  )
)

(define stack (make-stack 4))

(stack 'push! 'a)
(stack 'push! 'b)
(stack 'push! 'c)

(print (stack 'ref 0))  ; c
(print (stack 'ref 2))  ; a
(stack 'set! 1 'd)
(print (stack 'ref 1))  ; d
(print (stack 'top))  ; c
(stack 'pop!)
(print (stack 'top))  ; d