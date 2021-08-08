(define print
  (lambda (x)
    (for-each display `(,x, "\n"))
  )
)

(define length
  (lambda (ls)
    (if (null? ls)
      0
      (+ (length (cdr ls)) 1)
    )
  )
)

(print (length `()))
(print (length `(a)))
(print (length `(a b)))

; 0
; 1
; 2