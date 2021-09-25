(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define-syntax set-of
  (syntax-rules ()
    (
      (_ e m ...)
      (set-of-help e '() m ...)
    )
  )
)
(define-syntax set-of-help
  (syntax-rules (in is)
    [
      (_ e base)
      (set-cons e base)
    ]
    [
      (_ e base (x in s) m ...)
      (let loop ([set s])
        (if (null? set)
          base
          (let ([x (car set)])
            (set-of-help e (loop (cdr set)) m ...)
          )
        )
      )
    ]
    [
      (_ e base (x is y) m ...)
      (let ([x y])
        (set-of-help e base m ...)
      )
    ]
    [
      (_ e base p m ...)
      (if p
        (set-of-help e base m ...)
        base
      )
    ]
  )
)
(define set-cons
  (lambda (x y)
    (if (memv x y)
      y
      (cons x y)
    )
  )
)

(print
  (set-of x (x in '(a b c)))
)
(print
  (
    set-of x
      (x in '(1 2 3 4))
      (even? x)
  )
)
(print
  (
    set-of (cons x y)
      (x in '(1 2 3))
      (y is (* x x))
  )
)
(print
  (
    set-of (cons x y)
      (x in '(a b))
      (y in '(1 2))
  )
)