(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define ls
  (let ([ls (cons 'a '())])
    (set-cdr! ls ls)
    ls
  )
)

(print (length ls))

; Error: (length) bad argument type - not a non-cyclic list: (a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a...