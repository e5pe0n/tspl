(define print
  (lambda (x)
    (for-each display `(,x "\n"))))

(print (call/cc
  (lambda (k)
    (* 5 4))))  ; 20
(print (call/cc
  (lambda (k)
    (* 5 (k 4)))))  ; 4
(print (+ 2 (call/cc
  (lambda (k)
    (* 5 (k 4)))))) ; 6
(newline)

(define product
  (lambda (ls)
    (call/cc
      (lambda (break)
        (let f ([ls ls])
          (cond
            [(null? ls) 1]
            [(= (car ls) 0) (break 0)]
            [else (* (car ls) (f (cdr ls)))]))))))
(print (product `(1 2 3 4 5)))  ; 120
(print (product `(7 3 8 0 1 9 5)))  ; 0
(print (product `())) ; 1 <- OK?
(newline)

(print
  (let ([x (call/cc (lambda (k) k))])
    (x (lambda (ignore) "hi"))))  ; hi
(print
  (((call/cc (lambda (k) k))
    (lambda (x) x)) "HEY!"))  ; HEY!
(newline)


(define retry #f)
(define factorial
  (lambda (x)
    (if (= x 0)
      (call/cc (lambda (k) (set! retry k) 1))
      (* x (factorial (- x 1)))
    )
  )
)

(print (factorial 4))
(print (retry 1))
(print (retry 2))
