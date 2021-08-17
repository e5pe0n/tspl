(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)


(define flip-flop
  (let ([state #f])
    (lambda ()
      (set! state (not state))
      state
    )
  )
)
(print (flip-flop)) ; #t
(print (flip-flop)) ; #f
(print (flip-flop)) ; #t


(define memoize
  (lambda (proc)
    (let ([cache `()])
      (lambda (x)
        (cond
          [(assq x cache) => cdr]
          [else (let ([ans (proc x)])
            (set! cache (cons (cons x ans) cache))
            ans
          )]
        )
      )
    )
  )
)
(define fibonacci
  (memoize
    (lambda (n)
      (if (< n 2)
        1
        (+ (fibonacci (- n 1)) (fibonacci (- n 2)))
      )
    )
  )
)
(print (fibonacci 100)) ; 573147844013817084101