(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)
(define a
  (lambda ()
    (car (car `((a b) (c d))))
  )
)
(define b
  (lambda ()
    (car (cdr (car `((a b) (c d)))))
  )
)
(define c
  (lambda ()
    (car (car (cdr `((a b) (c d)))))
  )
)
(define d
  (lambda ()
    (car (cdr (car (cdr `((a b) (c d))))))
  )
)
(for-each print `(
  ,(a)
  ,(b)
  ,(c)
  ,(d)
))

; a
; b
; c
; d