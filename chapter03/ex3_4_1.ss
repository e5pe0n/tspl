(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define reciprocal
  (lambda (n success failure)
    (if (= n 0)
      (failure)
      (success (/ 1 n))
    )
  )
)

(print
  (reciprocal 10 (lambda (x) x) (lambda () "oops!"))
) ; 1/10
(print
  (reciprocal 0 (lambda (x) x) (lambda () "oops!"))
) ; oops!