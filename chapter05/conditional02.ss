(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

; not
(print (not #f))  ; #t
(print (not #t))  ; #f
(print (not `())) ; #f since `() == true
(print (not (< 4 5))) ; #f

; and
(print
  (let ([x 3])
    (and (> x 2) (< x 4))
  )
) ; #t
(print
  (let ([x 5])
    (and (> x 2) (< x 4))
  )
) ; #f
(print
  (and #f `(a b) `(c d))
) ; #f
(print
  (and `(a b) `(c d) `(e f))
) ; (e f)

; or
(print
  (let ([x 3])
    (or (< x 2) (> x 4))
  )
) ; #f
(print
  (let ([x 5])
    (or (< x 2) (> x 4))
  )
) ; #t
(print
  (or #f `(a b) `(c d))
) ; (a b)