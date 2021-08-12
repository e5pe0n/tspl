(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define lwp-list `())
(define lwp
  (lambda (thunk)
    (set! lwp-list (append lwp-list (list thunk)))
  )
)
(define start
  (lambda ()
    (call/cc
      (lambda (k)
        (set! quit-k k)
        (next)
      )
    )
  )
)
(define next
  (lambda ()
    (let ([p (car lwp-list)])
      (set! lwp-list (cdr lwp-list))
      (p)
    )
  )
)
(define pause
  (lambda ()
    (call/cc
      (lambda (k)
        (lwp (lambda () (k #f)))
        (next)
      )
    )
  )
)
(define quit
  (lambda (v)
    (if (null? lwp-list)
      (quit-k v)
      (next)
    )
  )
)