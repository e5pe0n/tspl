(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define calc #f)
(let ()
  (define do-calc
    (lambda (ek expr)
      (cond
        [(number? expr) expr]
        [
          (and
            (list? expr)
            (= (length expr) 3)
            (let ([op (car expr)] [args (cdr expr)])
              (case op
                [(add) (apply-op ek + args)]
                [(sub) (apply-op ek - args)]
                [(mul) (apply-op ek * args)]
                [(div) (apply-op ek / args)]
                [else (complain ek "invalid operator" op)]
              )
            )
          )
        ]
        [else (complain ek "invalid expression" expr)]
      )
    )
  )
  (define apply-op
    (lambda (ek op args)
      (op (do-calc ek (car args)) (do-calc ek (cadr args)))
    )
  )
  (define complain
    (lambda (ek msg expr)
      (ek (list msg expr))
    )
  )
  (set! calc
    (lambda (expr)
      (call/cc
        (lambda (ek)
          (do-calc ek expr)
        )
      )
    )
  )
)

(print (calc `(add (mul 3 2) -4)))  ; 2
(print (calc `(div 1/2 1/6))) ; 3
(print (calc `(add (mul 3 2) (div 4)))) ; (invalid expression (div 4))
(print (calc `(mul (add 1 -2) (pow 2 7))))  ; (invalid operator pow)
