(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(import grades)
(print (gpa a x b c))