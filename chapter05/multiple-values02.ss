(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define split
  (lambda (ls)
    (if (or (null? ls) (null? (cdr ls)))
      (values ls `())
      (call-with-values
        (lambda () (split (cddr ls)))
        (lambda (odds evens)
          (values
            (cons (car ls) odds)
            (cons (cadr ls) evens)
          )
        )
      )
    )
  )
)
(call-with-values
  (lambda () (split `(a b c d e f)))
  (lambda (x y) (print x) (print y))
)
; (a c e)
; (b d f)

(print
  (call-with-values
    (lambda ()
      (call/cc (lambda (k) (k 2 3)))
    )
    (lambda (x y) (list x y))
  )
) ; (2 3)


(define-syntax first
  (syntax-rules ()
    [
      (_ expr)
      (call-with-values
        (lambda () expr)
        (lambda (x . y) x)
      )
    ]
  )
)
(print
  (if (first (values #t #f)) 'a 'b)
) ; a


(define-syntax with-values
  (syntax-rules ()
    [
      (_ expr consumer)
      (call-with-values
        (lambda () expr)
        consumer
      )
    ]
  )
)
(print
  (with-values
    (values 1 2)
    list
  )
) ; (1 2)
(print
  (with-values
    (split `(1 2 3 4))
    (lambda (odds evens) evens)
  )
) ; (2 4)


(print
  (let-values
    ([(odds evens) (split `(1 2 3 4))])
    evens
  )
) ; (2 4)