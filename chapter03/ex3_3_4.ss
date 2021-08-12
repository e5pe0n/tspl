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

(define lwp-list (make-queue))
(define lwp
  (lambda (thunk)
    (putq! lwp-list thunk)
  )
)
(define start
  (lambda ()
    (let ([p (getq lwp-list)])
      (delq! lwp-list)
      (p)
    )
  )
)
(define pause
  (lambda ()
    (call/cc
      (lambda (k)
        (lwp (lambda () (k #f)))
        (start)
      )
    )
  )
)