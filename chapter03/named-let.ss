(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define list?
  (lambda (x)
    (let race ([h x] [t x])
      (if (pair? h)
          (let ([h (cdr h)])
            (if (pair? h)
                (and (not (eq? h t))
                     (race (cdr h) (cdr t)))
                (null? h)))
          (null? h)))))

(print (list? `())) ; #t
(print (list? `(1 2 3)))  ; #t
(print (list? `(a . b)))  ; #f
(print (list? (let ([ls (cons 'a `())])
  (set-cdr! ls ls)
  ls
))) ; #f