(define print
  (lambda (x)
    (for-each display `(,x, "\n"))
  )
)

(define list-copy
  (lambda (ls)
    (if (null? ls)
      `()
      (cons (car ls)
            (list-copy (cdr ls)))
    )
  )
)

(print
  (let ([copy (list-copy `(a b c))])
    copy
  )
)

; (a b c)