(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define reciprocals-cps
  (lambda (ls k)
    (let ([break k])
      (let f ([p k] [ls ls] [k k])
        (cond
          [(null? ls) (k `())]
          [(= (car ls) 0) (break "zero found")]
          [else (f p (cdr ls) (lambda (x) (k (cons (/ 1 (car ls)) x))))]
        )
      )
    )
  )
)

(print (reciprocals-cps `(2 1/3 5 1/4) (lambda (x) x))) ; (1/2 3 1/5 4)
(print (reciprocals-cps `(2 1/3 0 5 1/4) (lambda (x) x))) ; zero found