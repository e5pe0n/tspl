(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define-syntax _when
  (syntax-rules ()
    [(_ test e1 e2 ...) (if test (begin e1 e2 ...))]
  )
)

(define-syntax _unless
  (syntax-rules ()
    [(_ test e1 e2 ...) (_when (not test) e1 e2 ...)]
  )
)


(define f
  (lambda (x)
    (unless (= x 4) (set! x (+ x 1)) (set! x (* x 2)))
    x
  )
)

(define _f
  (lambda (x)
    (_unless (= x 4) (set! x (+ x 1)) (set! x (* x 2)))
    x
  )
)

(define g
  (lambda (x)
    (when (= x 4) (set! x (+ x 1)) (set! x (* x 2)))
    x
  )
)

(define _g
  (lambda (x)
    (_when (= x 4) (set! x (+ x 1)) (set! x (* x 2)))
    x
  )
)

(print (f 0)) ; 2
(print (f 4)) ; 4
(print (g 0)) ; 0
(print (g 4)) ; 10
(newline)
(print (_f 0))  ; 2
(print (_f 4))  ; 4
(print (_g 0))  ; 0
(print (_g 4))  ; 10