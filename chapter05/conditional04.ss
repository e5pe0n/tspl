(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

; `when` is used instead of `if` without `else`
(print
  (let ([x -4] [sign 'plus])
    (when (< x 0)
      (set! x (- 0 x))
      (set! sign 'minus)
    )
    (list sign x)
  )
) ; (minus 4)

(define check-pair
  (lambda (x)
    (unless (pair? x)
      (error "invalid argument" x)
    )
    x
  )
)
(print (check-pair `(a b c))) ; (a b c)
(print (check-pair 1)) ; Error: invalid argument: 1


; case
(print
  (let ([x 4] [y 5])
    (case (+ x y)
      [(1 3 5 7 9) 'odd]
      [(0 2 4 6 8) 'even]
      [else 'out-of-range]
    )
  )
)