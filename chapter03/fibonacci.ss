(define print
  (lambda (x)
    (for-each display `(,x "\n"))))

(define fibonacci
  (lambda (n)
    (let fib ([i n])
      (cond
        [(= i 0) 0]
        [(= i 1) 1]
        [else (+ (fib (- i 1)) (fib (- i 2)))]))))

(define fibonacci-acc
  (lambda (n)
    (if (= n 0)
      0
      (let fib ([i n] [a1 1] [a2 0])
        (if (= i 1)
          a1
          (fib (- i 1) (+ a1 a2) a1))))))

(print (fibonacci 0)) ; 0
(print (fibonacci 1)) ; 1
(print (fibonacci 2)) ; 1
(print (fibonacci 3)) ; 2
(print (fibonacci 4)) ; 3
(print (fibonacci 5)) ; 5
(print (fibonacci 6)) ; 8
(print (fibonacci 20))  ; 6765
(print (fibonacci 30))  ; 832040
(print (fibonacci 35))  ; 9227465
(print (fibonacci 40))  ; 102334155
(newline)
(print (fibonacci-acc 0)) ; 0
(print (fibonacci-acc 1)) ; 1
(print (fibonacci-acc 2)) ; 1
(print (fibonacci-acc 3)) ; 2
(print (fibonacci-acc 4)) ; 3
(print (fibonacci-acc 5)) ; 5
(print (fibonacci-acc 6)) ; 8
(print (fibonacci-acc 20))  ; 6765
(print (fibonacci-acc 30))  ; 832040
(print (fibonacci-acc 35))  ; 9227465
(print (fibonacci-acc 40))  ; 102334155