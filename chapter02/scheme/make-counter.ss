(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define make-counter
  (lambda ()
    (let ([next 0])
      (lambda ()
        (let ([v next])
          (set! next (+ next 1))
          v
        )
      )
    )
  )
)

(define count1 (make-counter))
(define count2 (make-counter))

(print (count1))  ; 0
(print (count2))  ; 0
(print (count1))  ; 1
(print (count1))  ; 2
(print (count2))  ; 1