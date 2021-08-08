(define print
  (lambda (x)
    (for-each display `(,x, "\n"))
  )
)

(define append2
  (lambda (ls1 ls2)
    (if (not (null? ls1))
      (cons (car ls1) (append2 (cdr ls1) ls2))
      (if (not (null? ls2))
        (cons (car ls2) (append2 ls1 (cdr ls2)))
        `()
      )
    )
  )
)

(print (append2 `(1 2 3) `(a b c)))
(print (append2 `(1 2 3 4 5) `(a b c)))
(print (append2 `(1 2) `(a b c e f g)))

; (1 2 3 a b c)
; (1 2 3 4 5 a b c)
; (1 2 a b c e f g)