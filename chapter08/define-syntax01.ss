(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (let ()
    (define even?
      (lambda (x)
        (or (= x 0) (odd? (- x 1)))
      )
    )
    (define-syntax odd?
      (syntax-rules ()
        [(_ x) (not (even? x))]
      )
    )
    (even? 10)
  )
) ; #t