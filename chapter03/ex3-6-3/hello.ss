(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print (make-string 5 #\*))