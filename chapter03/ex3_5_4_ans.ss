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
            (= (length expr) 2)
            (let ([op (car expr)] [args (cdr expr)])
              (case op
                [(minus) (apply-op1 ek - args)]
                [(sqrt) (apply-op1 ek sqrt args)]
                [else (complain ek "invalid unary operator" op)]
              )
            )
          )
        ]
        [
          (and
            (list? expr)
            (= (length expr) 3)
            (let ([op (car expr)] [args (cdr expr)])
              (case op
                [(add) (apply-op2 ek + args)]
                [(sub) (apply-op2 ek - args)]
                [(mul times) (apply-op2 ek * args)]
                [(div) (apply-op2 ek / args)]
                [(expt) (apply-op2 ek expt args)]
                [else (complain ek "invalid binary operator" op)]
              )
            )
          )
        ]
        [else (complain ek "invalid expression" expr)]
      )
    )
  )
  (define apply-op1
    (lambda (ek op args)
      (op (do-calc ek (car args)))
    )
  )
  (define apply-op2
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

(print (calc `(minus (add 2 3)))) ; -5