(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(import grades)
(histogram
  (current-output-port)
  (distribution a b a c c a c a f b a)
)
