(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define f
  (lambda (ls)
    (let ([x (memv 'a ls)])
      (and x (memv 'b x))
    )
  )
)

(define expanded-f
  (lambda (ls)
    ((lambda (x)
      (if x (memv 'b x) #f)
    ) (memv 'a ls))
  )
)

(define ls1 `(a b c))
(define ls2 `(1 2 3))

(print (f ls1)) ; (b c)
(print (f ls2)) ; #f

(print (expanded-f ls1))  ; (b c)
(print (expanded-f ls2))  ; #f