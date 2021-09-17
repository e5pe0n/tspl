(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (let ([x 0])
    (cond
      [(< x 0) (list 'minus (abs x))]
      [(> x 0) (list 'plus x)]
      [else (list 'zero x)]
    )
  )
) ; (zero 0)

(define select
  (lambda (x)
    (cond
      [(not (symbol? x))]
      [(assq x `((a . 1) (b . 2) (c . 3))) => cdr]
      [else 0]
    )
  )
)
(print (select 3))  ; #t
(print (select 'b)) ; 2
(print (select 'e)) ; 0