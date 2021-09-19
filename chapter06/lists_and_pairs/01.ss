(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

; cons
(print
  (cons 'a '())
) ; (a)
(print
  (cons 'a '(b c))
) ; (a b c)
(print
  (cons 3 4)
) ; (3 . 4)

; cdr
(print
  (cdr '(a))
) ; ()
(print
  (cdr '(a b c))
) ; (b c)
(print
  (cdr (cons 3 4))
) ; 4

; set-car!
(print
  (let ([x (list 'a 'b 'c)])
    (set-car! x 1)
    x
  )
) ; (1 b c)

; set-cdr!
(print
  (let ([x (list 'a 'b 'c)])
    (set-cdr! x 1)
    x
  )
) ; (a . 1)

(print
  (caar '((a)))
) ; a
(print
  (cadr '(a b c))
) ; b
(print
  (cdddr '(a b c d))
) ; (d)
(print
  (cadadr '(a (b c)))
) ; c