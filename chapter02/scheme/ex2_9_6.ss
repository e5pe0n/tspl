(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define make-queue
  (lambda ()
    `(() #f)
  )
)

(define emptyq?
  (lambda (q)
    (null? (car q))
  )
)

(define putq!
  (lambda (q v)
    (let ([new `(,v)])
      (if (emptyq? q)
        (begin
          (set-car! q new)
          (set-cdr! q new)
        )
        (begin
          (set-cdr! (cdr q) new)
          (set-cdr! q new)
        )
      )
    )
  )
)

(define getq
  (lambda (q)
    (if (emptyq? q)
      (error "queue is empty!")
      (car (car q))
    )
  )
)

(define delq!
  (lambda (q)
    (if (emptyq? q)
      (error "queue is empty!")
      (set-car! q (cdr (car q)))
    )
  )
)

(define q (make-queue))

(putq! q 'a)
(putq! q 'b)
(print q) ; ((a b) b)
(print (getq q))  ; a
(newline)

(delq! q)
(print q) ; ((b) b)
(print (getq q))  ; b
(newline)

(delq! q)

(putq! q 'c)
(putq! q 'd)
(print q) ; ((c d) d)
(print (getq q))  ; c
(newline)

(delq! q)
(print q) ; ((d) d)
(print (getq q))  ; d