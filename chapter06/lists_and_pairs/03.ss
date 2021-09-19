(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  (let ([ls (list 'a 'b 'c)])
    (set-car! (memv 'b ls) 'z)
    ls
  )
) ; (a z c)

(print
  (let ()
    (define member?
      (lambda (x ls)
        (and (member x ls) #t)
      )
    )
    (member? '(b) '((a) (b) (c)))
  )
) ; #t

(define count-occurrences
  (lambda (x ls)
    (cond
      [(memq x ls) => (lambda (ls) (+ (count-occurrences x (cdr ls)) 1))]
      [else 0]
    )
  )
)
(print
  (count-occurrences 'a '(a b c d a))
) ; 2