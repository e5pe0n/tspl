(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (let ([ls `(a b c)])
    (if (null? ls)
      `()
      (cdr ls)
    )
  )
) ; (b c)

(print
  (let ([ls `()])
    (if (null? ls)
      `()
      (cdr ls)
    )
  )
) ; ()

(print
  (let
    ([
      abs (lambda (x)
        (if (< x 0)
          (- 0 x)
          x
        )
      )
    ])
    (abs -4)
  )
) ; 4

(print
  (let ([x -4])
    (if (< x 0)
      (list 'minus (- 0 x))
      (list 'plus 4)
    )
  )
) ; (minus 4)