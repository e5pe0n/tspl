(define print
  (lambda (x)
    (for-each display `(,x "\n"))))

(define factor
  (lambda (n)
    (letrec (
      [f2 (lambda (x)
        (let ([t (/ x 2)])
          (cond
            [(> (* 2 2) x) (if (> x 1) (list x) `())]
            [(integer? t) (cons 2 (f2 t))]
            [else (f3 x 3)])))]
      [f3 (lambda (x i)
        (let ([t (/ x i)])
          (cond
            [(> (* i i) x) (if (> x 1) (list x) `())]
            [(integer? t) (cons i (f3 t i))]
            [else (f3 x (+ i 2))])))])
      (cond
        [(= n 0) `(0)]
        [(= n 1) `(1)]
        [else (f2 n)]))))

(print (factor 0))  ; (0)
(print (factor 1))  ; (1)
(print (factor 2))  ; (2)
(print (factor 12)) ; (2 2 3)
(print (factor 3628800))  ; (2 2 2 2 2 2 2 2 3 3 3 3 5 5 7)
(print (factor 9239)) ; (9239)