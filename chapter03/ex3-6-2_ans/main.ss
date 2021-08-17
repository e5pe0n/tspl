(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(import grades)
(print (distribution a b a c c c a f b a))  ; ((4 a) (2 b) (3 c) (0 d) (0 e) (1 f))