(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define atom
  (lambda (x)
    (not (pair? x))
  )
)

(print (atom `(1 2)))
(print (atom `(a b c)))
(print (atom `()))
(print (atom 12))

; #f
; #f
; #t
; #t