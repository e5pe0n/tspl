(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define x 3)
(begin
  (set! x (+ x 1))
  (print (+ x x)) ; 8
)


(let ()
  (begin  ; here begin is needed...?
    (define x 3)
    (define y 4)
  )
  (print (+ x y)) ; 7
)


(define swap-pair!
  (lambda (x)
    (let ([temp (car x)])
      (set-car! x (cdr x))
      (set-cdr! x temp)
      x
    )
  )
)
(print
  (swap-pair! (cons 'a 'b)) ; (b . a)
)