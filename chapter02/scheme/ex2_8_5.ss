(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define shorter?
  (lambda (ls1 ls2)
    (cond
      [(null? ls1) #t]
      [(null? ls2) #f]
      [else (shorter? (cdr ls1) (cdr ls2))]
    )
  )
)

(define shorter
  (lambda (ls1 ls2)
    (if (shorter? ls1 ls2)
      ls1
      ls2
    )
  )
)

(define ls1 `(1 2 3))
(define ls2 `(1 2 3 4 5))

(print (shorter ls1 ls2))
(print (shorter ls2 ls1))

; (1 2 3)
; (1 2 3)