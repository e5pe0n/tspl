(define print
  (lambda (x)
    (for-each display `(,x "\n"))))

(define-syntax _let
  (syntax-rules ()
    [(_ ((x e) ...) b1 b2 ...)
      ((lambda (x ...) b1 b2 ...) e ...)]
    [(_ name ((x e) ...) b1 b2 ...)
      (letrec ((name (lambda (x ...) b1 b2 ...)))
        (name x ...))]))

(define f
  (let sum ([ls `(1 2 3 4 5)])
    (if (null? ls) 0 (+ (car ls) (sum (cdr ls))))))

(print f) ; 15