(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define q `())
(set-car! q 'a)
(print q)