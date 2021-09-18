(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (call-with-values
    (lambda () (values 'bond 'james))
    (lambda (x y) (cons y x))
  )
) ; (james . bond)

(print
  (call-with-values values list)
) ; ()

(define dxdy
  (lambda (p1 p2)
    (values
      (- (car p2) (car p1))
      (- (cdr p2) (cdr p1))
    )
  )
)
(define segment-length
  (lambda (p1 p2)
    (call-with-values
      (lambda () (dxdy p1 p2))
      (lambda (dx dy) (sqrt (+ (* dx dx) (* dy dy))))
    )
  )
)
(define segment-slope
  (lambda (p1 p2)
    (call-with-values
      (lambda () (dxdy p1 p2))
      (lambda (dx dy) (/ dy dx))
    )
  )
)
(print
  (segment-length `(1 . 4) `(4 . 8))
) ; 5
(print
  (segment-slope `(1 . 4) `(4 . 8))
) ; 4/3

(define describe-segment
  (lambda (p1 p2)
    (call-with-values
      (lambda () (dxdy p1 p2))
      (lambda (dx dy)
        (values
          (sqrt (+ (* dx dx) (* dy dy)))
          (/ dy dx)
        )
      )
    )
  )
)
(call-with-values
  (lambda () (describe-segment `(1 . 4) `(4 . 8)))
  (lambda (x y) (print x) (print y))
)
; 5
; 4/3