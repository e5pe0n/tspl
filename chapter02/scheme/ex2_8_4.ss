(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define list-ref
  (lambda (ls n)
    (if (= n 0)
      (car ls)
      (list-ref (cdr ls) (- n 1))
    )
  )
)

(define list-tail
  (lambda (ls n)
    (if (= n 0)
      ls
      (list-tail (cdr ls) (- n 1))
    )
  )
)

(define ls1 `(1 2 3 4))
(define ls2 `(a short (nested) list))

(print (list-ref ls1 0))
(print (list-tail ls1 0))
(print (list-ref ls2 2))
(print (list-tail ls2 2))

; 1
; (1 2 3 4)
; (nested)
; ((nested) list)