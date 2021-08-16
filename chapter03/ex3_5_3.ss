(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define calc #f)
(let ()
  (define do-calc
    (lambda (expr)
      (cond
        [(number? expr) expr]
        [
          (and
            (list? expr)
            (= (length expr) 3)
            (let ([op (car expr)] [args (cdr expr)])
              (case op
                [(add) (apply-op + args)]
                [(sub) (apply-op - args)]
                [(mul) (apply-op * args)]
                [(div) (apply-op / args)]
                [else (complain "invalid operator" op)]
              )
            )
          )
        ]
        [else (complain "invalid expression" expr)]
      )
    )
  )
  (define apply-op
    (lambda (op args)
      (op (do-calc (car args)) (do-calc (cadr args)))
    )
  )
  (define complain
    (lambda (msg expr)
      (error (list msg expr))
    )
  )
  (set! calc
    (lambda (expr)
      (do-calc expr)
    )
  )
)

(print (calc `(add (mul 3 2) -4)))  ; 2
(print (calc `(div 1/2 1/6))) ; 3
(print (calc `(add (mul 3 2) (div 4)))) ; (invalid expression (div 4))
(print (calc `(mul (add 1 -2) (pow 2 7))))  ; (invalid operator pow)
