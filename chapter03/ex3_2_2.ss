(define print
  (lambda (x)
    (for-each display `(,x "\n"))))

(define factor
  (lambda (n)
    (letrec ([f (lambda (n i)
      (cond
        [(>= i n) (list n)]
        [(integer? (/ n i)) (cons i (f (/ n i) i))]
        [else (f n (+ i 1))]))])
      (f n 2))))

(print (factor 0))  ; (0)
(print (factor 1))  ; (1)
(print (factor 12)) ; (2 2 3)
(print (factor 3628800))  ; (2 2 2 2 2 2 2 2 3 3 3 3 5 5 7)
(print (factor 9239)) ; (9239)