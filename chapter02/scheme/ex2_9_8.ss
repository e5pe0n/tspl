(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define floyd
  (lambda (ls1 ls2)
    (if (or (null? ls1) (null? ls2))
      #f
      (if (or (not (pair? ls1)) (not (pair? ls2)))
        #t
        (if (null? (cdr ls2))
          #f
          (if (not (pair? (cdr ls2)))
            #t
            (let ([tortoise (cdr ls1)] [hare (cdr (cdr ls2))])
              (or (eqv? tortoise hare) (floyd tortoise hare))
            )
          )
        )
      )
    )
  )
)

(define list?
  (lambda (ls)
    (not (floyd ls ls))
  )
)


(print (list? `())) ; #t
(print (list? `(1 2 3)))  ; #t
(print (list? `(a . b)))  ; #f
(print (list? (let ([ls (cons 'a `())])
  (set-cdr! ls ls)
  ls
))) ; #f