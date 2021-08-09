(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define cons-count 0)

(define kons
  (lambda (x y)
    (set! cons-count (+ cons-count 1))
    (cons x y)
  )
)

(kons 'a `(b c))
(print cons-count)  ; 1
(kons 'a (kons 'b (kons 'c `())))
(print cons-count)  ; 4