(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define list-ref
  (lambda (ls n)
    (if (= n 0)
      (car ls)
      (list-ref (cdr ls) (- n 1))
    )
  )
)

(define list-tail
  (lambda (ls n)
    (if (= n 0)
      ls
      (list-tail (cdr ls) (- n 1))
    )
  )
)

(define make-stack
  (lambda ()
    (let ([ls `()])
      (lambda (msg . args)
        (case msg
          [(empty? mt?) (null? ls)]
          [(push!) (set! ls (cons (car args) ls))]
          [(top) (car ls)]
          [(pop!) (set! ls (cdr ls))]
          [(ref) (list-ref ls (car args))]
          [(set!) (set-car! (list-tail ls (car args)) (cadr args))]
          [else "oops"]
        )
      )
    )
  )
)

(define stack (make-stack))

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