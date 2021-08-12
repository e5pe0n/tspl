(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define product
  (lambda (ls)
    (let f ([ls ls] [res 1])
      (if (null? ls)
        res
        (let ([t (* res (car ls))])
          (if (= t 0)
            0
            (f (cdr ls) t)
          )
        )
      )
    )
  )
)

(print (product `(1 2 3 4 5)))  ; 120
(print (product `(7 3 8 0 1 9 5)))  ; 0
(print (product `())) ; 1
