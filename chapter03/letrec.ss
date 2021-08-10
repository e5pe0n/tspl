(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define sum1
  (let ([sum (lambda (sum ls)
    (if (null? ls) 0 (+ (car ls) (sum sum (cdr ls)))))])
    (sum sum `(1 2 3 4 5))
  )
)

(define sum2
  (letrec ([sum (lambda (ls)
    (if (null? ls) 0 (+ (car ls) (sum (cdr ls))))
  )])
    (sum `(1 2 3 4 5))
  )
)

(define even?-odd?
  (letrec (
    [even? (lambda (x)
      (or (= x 0) (odd? (- x 1)))
    )]
    [odd? (lambda (x)
      (and (not (= x 0)) (even? (- x 1)))
    )]
  )
    (list (even? 20) (odd? 20))
  )
)

(define list?
  (lambda (x)
    (letrec
      ([race (lambda (h t)
        (if (pair? h)
          (let ([h (cdr h)])
            (if (pair? h)
                (and (not (eq? h t))
                     (race (cdr h) (cdr t)))
                (null? h)))
          (null? h))
      )])
      (race x x)
    )
  )
)


(print sum1)  ; 15
(print sum2)  ; 15

(print even?-odd?)  ; (#t #f)

(print (list? `())) ; #t
(print (list? `(1 2 3)))  ; #t
(print (list? `(a . b)))  ; #f
(print (list? (let ([ls (cons 'a `())])
  (set-cdr! ls ls)
  ls
))) ; #f