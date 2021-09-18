(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define member
  (lambda (x ls)
    (call/cc
      (lambda (break)
        (do ([ls ls (cdr ls)])
          ((null? ls) #f)
          (when (equal? x (car ls))
            (break ls)
          )
        )
      )
    )
  )
)
(print (member 'd `(a b c)))  ; #f
(print (member 'b `(a b c)))  ; (b c)