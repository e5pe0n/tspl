(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define map/k
  (lambda (p ls k)
    (if (null? ls)
      (k `())
      (p (car ls)
        (lambda (x)
          (map/k p (cdr ls)
            (lambda (ls)
              (k (cons x ls))
            )
          )
        )
      )
    )
  )
)

(define reciprocals
  (lambda (ls)
    (map/k
      (lambda (x k)
        (if (= x 0)
          "zero found"
          (k (/ 1 x))
        )
      )
      ls
      (lambda (x) x)
    )
  )
)

(print (reciprocals `(2 1/3 5 1/4))) ; (1/2 3 1/5 4)
(print (reciprocals `(2 1/3 0 5 1/4))) ; zero found