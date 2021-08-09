(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define f
  (lambda (x)
    (or (memv x `(a b c)) (list x))
  )
)

(define expanded-f
  (lambda (x)
    (let ([t (memv x `(a b c))])
      (if t t
        (let ([s (list x)])
          (if s s #f)
        )
      )
    )
  )
)

(print (f 'a))  ; (a b c)
(print (f 'z))  ; (z)

(print (expanded-f 'a)) ; (a b c)
(print (expanded-f 'z)) ; (z)