(define print
  (lambda (x)
    (for-each display `(,x, "\n"))
  )
)

(define make-list
  (lambda (n obj)
    (if (= n 0)
      `()
      (cons obj (make-list (- n 1) obj))
    )
  )
)

(print (make-list 7 `()))
(print (make-list 10 10))

; (() () () () () () ())
; (10 10 10 10 10 10 10 10 10 10)