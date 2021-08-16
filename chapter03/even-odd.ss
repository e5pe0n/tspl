(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(let ()
  (define even?
    (lambda (x)
      (or (= x 0) (odd? (- x 1)))
    )
  )
  (define odd?
    (lambda (x)
      (and (not (= x 0)) (even? (- x 1)))
    )
  )
  (print (even? 20))  ; #t
  (print (odd? 20)) ; #f
)
