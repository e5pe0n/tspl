(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define inf-loop
  (lambda ()
    (let ([k.n (call/cc (lambda (k) (cons k 0)))])
      (let ([k (car k.n)] [n (cdr k.n)])
        (write n)
        (newline)
        (k (cons (k (+ n 1))))
      )
    )
  )
)
