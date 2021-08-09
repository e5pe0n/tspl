(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define-syntax _let*
  (syntax-rules ()
    [(_ ((x e)) b1 b2 ...) (let ([x e]) b1 b2 ...)]
    [(_ ((x e) (x1 e1) ...) b1 b2 ...)
      (let ([x e]) (_let* ((x1 e1) ...) b1 b2 ...))]
  )
)

(print
  (let* ([a 5] [b (+ a a)] [c (+ a b)])
    (list a b c)
  )
) ; (5 10 15)

(print
  (_let* ([a 5] [b (+ a a)] [c (+ a b)])
    (list a b c)
  )
) ; (5 10 15)