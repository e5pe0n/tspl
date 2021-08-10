(define print
  (lambda (x)
    (for-each display `(,x "\n"))))

(define fibonacci
  (lambda (n)
    (let ([cnt 0] [res 0])
      (set! res
        (let fib ([i n])
          (set! cnt (+ cnt 1))
          (cond
            [(= i 0) 0]
            [(= i 1) 1]
            [else (+ (fib (- i 1)) (fib (- i 2)))]))
      )
      (list cnt res))))

(define fibonacci-acc
  (lambda (n)
    (let ([cnt 0] [res 0])
      (set! res
        (if (= n 0)
          0
          (let fib ([i n] [a1 1] [a2 0])
            (set! cnt (+ cnt 1))
            (if (= i 1)
              a1
              (fib (- i 1) (+ a1 a2) a1)))))
      (list cnt res))))

; (print (fibonacci 0)) ; (1 0)
; (print (fibonacci 1)) ; (1 1)
; (print (fibonacci 2)) ; (3 1)
; (print (fibonacci 3)) ; (5 2)
; (print (fibonacci 4)) ; (9 3)
; (print (fibonacci 5)) ; (15 5)
; (print (fibonacci 6)) ; (25 8)
; (print (fibonacci 20))  ; (21891 6765)
; (print (fibonacci 30))  ; (2692537 832040)
; (print (fibonacci 35))  ; (29860703 9227465)
; (newline)
(print (fibonacci-acc 0)) ; (0 0)
(print (fibonacci-acc 1)) ; (1 1)
(print (fibonacci-acc 2)) ; (2 1)
(print (fibonacci-acc 3)) ; (3 2)
(print (fibonacci-acc 4)) ; (4 3)
(print (fibonacci-acc 5)) ; (5 5)
(print (fibonacci-acc 6)) ; (6 8)
(print (fibonacci-acc 20))  ; (20 6765)
(print (fibonacci-acc 30))  ; (30 832040)
(print (fibonacci-acc 35))  ; (35 9227465)