(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

; list-tail
(print
  (list-tail '(a b c) 0)
) ; (a b c)
(print
  (list-tail '(a b c) 2)
) ; (c)
(print
  (list-tail '(a b c) 3)
) ; ()
(print
  (list-tail '(a b c . d) 2)
) ; (c . d)
(print
  (list-tail '(a b c . d) 3)
) ; d
(print
  (let ([x (list 1 2 3)])
    (eq? (list-tail x 2)
      (cddr x)
    )
  )
) ; #t

; append
(print
  (append '(a b c) '())
) ; (a b c)
(print
  (append '() '(a b c))
) ; (a b c)
(print
  (append '(a b) '(c d))
) ; (a b c d)
(print
  (append '(a b) 'c)
) ; (a b . c)
(print
  (let ([x (list 'b)])
    (eq? x (cdr (append '(a) x)))
  )
) ; #t