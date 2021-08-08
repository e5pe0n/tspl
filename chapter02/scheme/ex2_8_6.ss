(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define even?
  (lambda (x)
    (if (= x 0)
      #t
      (odd? (- (abs x) 1))
    )
  )
)

(define odd?
  (lambda (x)
    (if (= x 0)
      #f
      (even? (- (abs x) 1))
    )
  )
)

(print (even? 10))
(print (even? 11))
(print (even? 0))
(print (even? 1))
(print (even? -10))
(print (even? -11))
(newline)
(print (odd? 10))
(print (odd? 11))
(print (odd? 0))
(print (odd? 1))
(print (odd? -10))
(print (odd? -11))

; #t
; #f
; #t
; #f
; #t
; #f

; #f
; #t
; #f
; #t
; #f
; #t