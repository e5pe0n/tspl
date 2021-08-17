(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define make-list
  (case-lambda
    [(n) (make-list n #f)]
    [
      (n x)
      (do
        ([n n (- n 1)] [ls `() (cons x ls)])
        ((zero? n) ls)
      )
    ]
  )
)

(define substring1
  (case-lambda
    [(s) (substring1 s 0 (string-length s))]
    [(s start) (substring1 s start (string-length s))]
    [(s start end) (substring s start end)]
  )
)

(define substring2
  (case-lambda
    [(s) (substring2 s 0 (string-length s))]
    [(s end) (substring2 s 0 end)]
    [(s start end) (substring s start end)]
  )
)

(define substring3
  (case-lambda
    [(s) (substring3 s 0 (string-length s))]
    [(s start end) (substring s start end)]
  )
)