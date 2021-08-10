(define print
  (lambda (x)
    (for-each display `(,x "\n"))))

(define factorial-rec
  (lambda (n)
    (let fact ([i n])
      (if (= i 0)
        1
        (* i (fact (- i 1)))))))

(define factorial-iter
  (lambda (n)
    (let fact ([i n] [a 1])
      (if (= i 0)
        a
        (fact (- i 1) (* a i))))))

(print (factorial-rec 0)) ; 1
(print (factorial-rec 1)) ; 1
(print (factorial-rec 2)) ; 2
(print (factorial-rec 3)) ; 6
(print (factorial-rec 10))  ; 3628800
(newline)
(print (factorial-iter 0))  ; 1
(print (factorial-iter 1))  ; 1
(print (factorial-iter 2))  ; 2
(print (factorial-iter 3))  ; 6
(print (factorial-iter 10)) ; 3628800