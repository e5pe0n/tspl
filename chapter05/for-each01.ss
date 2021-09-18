(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(let ([same-count 0])
  (for-each
    (lambda (x y)
      (when (= x y)
        (set! same-count (+ same-count 1))
      )
    )
    `(1 2 3 4 5 6)
    `(2 3 3 4 7 6)
  )
  (print same-count)  ; 3
)