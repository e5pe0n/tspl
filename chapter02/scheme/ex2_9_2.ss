(define print
  (lambda (x)
    (for-each display `(,x "\n"))
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
          [else "oops"]
        )
      )
    )
  )
)

(define stack1 (make-stack))
(define stack2 (make-stack))

(print (list (stack1 'empty?) (stack2 'empty?)))  ; (#t #t)
(stack1 'push! 'a)
(print (list (stack1 'empty?) (stack2 'empty?)))  ; (#f #t)

(stack1 'push! 'b)
(stack2 'push! 'c)
(print (stack1 'top)) ; b
(print (stack2 'top)) ; c

(stack1 'pop!)
(print (stack1 'top)) ; a
(print (list (stack1 'mt?) (stack2 'mt?)))  ; (#f #f)

(stack1 'pop!)
(print (list (stack1 'empty?) (stack2 'empty?))) ; (#t #f)
