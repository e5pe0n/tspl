(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define shorter
  (lambda (x y)
    (if (< (length x) (length y))
      x
      y
    )
  )
)

(define a `(1 2 3 4 5))
(define b `(1 2 3))

(print (shorter a b))
(print (shorter b a))
(print (shorter a a))

; (1 2 3)
; (1 2 3)
; (1 2 3 4 5)