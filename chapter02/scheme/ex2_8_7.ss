(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define transpose
  (lambda (ls)
    (cons (map car ls) (map cdr ls))
  )
)

(print (transpose `((a . 1) (b . 2) (c . 3))))

; ((a b c) 1 2 3)