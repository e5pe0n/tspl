(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)
(for-each print `(
  ,(cons 'car 'cdr)
  ,(list 'this '(is silly))
  ,(cons 'is '(this silly?))
  ,(quote (+ 2 3))
  ,(cons '+ '(2 3))
  ,(car '(+ 2 3))
  ,(cdr '(+ 2 3))
  ,(quote cons)
  ,(quote (quote cons))
  ,(car (quote (quote cons)))
  ,(+ 2 3)
  ,(+ '2 '3)
  ,(+ (car '(2 3)) (car (cdr '(2 3))))
  ,((car (list + - * /)) 2 3)
))

; (car . cdr)
; (this (is silly))
; (is this silly?)
; (+ 2 3)
; (+ 2 3)
; +
; (2 3)
; cons
; (quote cons)
; quote
; 5
; 5
; 5
; 5