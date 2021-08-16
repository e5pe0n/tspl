(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define product-cps
  (lambda (ls)
    (letrec (
      [f (lambda (ls_ break)
        (cond
          [(null? ls_) 1]
          [(= (car ls_) 0) (break)]
          [else (* (car ls_) (f (cdr ls_) break))]
        )
      )]
    )
      (f ls (lambda () 0))
    )
  )
)

(define product-cps-ans
  (lambda (ls k)
    (let ([break k])
      (let f ([ls ls] [k k])
        (cond
          [(null? ls) (k 1)]
          [(= (car ls) 0) (break 0)]
          [else (f (cdr ls) (lambda (x) (k (* (car ls) x))))]
        )
      )
    )
  )
)

(print (product-cps `(1 2 3 4 5)))  ; 120
(print (product-cps `(7 3 8 0 1 9 5)))  ; 0
(newline)
(print (product-cps-ans `(1 2 3 4 5) (lambda (x) x))) ; 120
(print (product-cps-ans `(7 3 8 0 1 9 5) (lambda (x) x))) ; 0