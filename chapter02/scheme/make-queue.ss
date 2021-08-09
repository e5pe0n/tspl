(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define make-queue
  (lambda ()
    (let ([end (cons 'ignored `())])
      (cons end end)
    )
  )
)

(define putq!
  (lambda (q v)
    (let ([end (cons 'ignored `())])
      (set-car! (cdr q) v)
      (set-cdr! (cdr q) end)
      (set-cdr! q end)
    )
  )
)

(define getq
  (lambda (q)
    (car (car q))
  )
)

(define delq!
  (lambda (q)
    (set-car! q (cdr (car q)))
  )
)


(define myq (make-queue))

(putq! myq 'a)
(putq! myq 'b)
(print (getq myq))  ; a
(delq! myq)
(print (getq myq))  ; b
(delq! myq)
(putq! myq 'c)
(putq! myq 'd)
(print (getq myq))  ; c
(delq! myq)
(print (getq myq))  ; d