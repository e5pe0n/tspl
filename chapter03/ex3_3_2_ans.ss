(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define product
  (lambda (ls)
    (if (null? ls)
      1
      (if (= (car ls) 0)
        0
        (let ([n (product (cdr ls))])
          (if (= n 0)
            0
            (* n (car ls))
          )
        )
      )
    )
  )
)