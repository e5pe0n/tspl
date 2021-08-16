(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define f (lambda (x) (* x x)))
(print
  (let ([x 3])
    (define f (lambda (y) (+ y x)))
    (f 4)
  )
) ; 7
(print (f 4)) ; 16

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

(define list?
  (lambda (x)
    (define race
      (lambda (h t)
        (if (pair? h)
          (let ([h (cdr h)])
            (if (pair? h)
              (and
                (not (eq? h t))
                (race (cdr h) (cdr t))
              )
              (null? h)
            )
          )
          (null? h)
        )
      )
    )
    (race x x)
  )
)

(let ([x 3])
  (define-syntax set-x!
    (syntax-rules ()
      [(_ e) (set! x e)]
    )
  )
  (set-x! (+ x x))
  (print x) ; 6
)