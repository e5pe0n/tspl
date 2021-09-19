(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

; assq
(print
  (assq 'b '((a . 1) (b . 2)))
) ; (b . 2)
(print
  (cdr (assq 'b '((a . 1) (b . 2))))
) ; 2
(print
  (assq 'c '((a . 1) (b . 2)))
) ; #f

; assv
(print
  (assv 2/3 '((1/3 . 1) (2/3 . 2)))
) ; (2/3 . 2)
(print
  (assv 2/3 '((1/3 . a) (3/4 . b)))
) ; #f

; assoc
(print
  (assoc '(a) '(((a) . a) (-1 . b)))
) ; ((a) . a)
(print
  (assoc '(a) '(((b) . b) (a . c)))
) ; #f
(print
  (let ([alist (list (cons 2 'a) (cons 3 'b))])
    (set-cdr! (assv 3 alist) 'c)
    alist
  )
) ; ((2 . a) (3 . c))
