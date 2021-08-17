(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (letrec*
    (
      [
        sum (lambda (x)
          (if (zero? x)
            0
            (+ x (sum (- x 1)))
          )
        )
      ]
      [f (lambda () (cons n n-sum))]
      [n 15]
      [n-sum (sum n)]
    )
    (f)
  )
) ; (15 . 120)
(print
  (letrec*
    (
      [f (lambda () (lambda () g))]
      [g (f)]
    )
    (eq? (g) g)
  )
) ; #t
; (print
;   (letrec*
;     (
;       [g (f)]
;       [f (lambda () (lambda () g))]
;     )
;     (eq? (g) g)
;   )
; ) ; error