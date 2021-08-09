(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (case 'x?
    [(x?) "ex?"]
    [('x?) "quoted ex?"]
  )
) ; ex? <- Why?!