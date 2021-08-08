(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define compose
  (lambda (p1 p2)
    (lambda (x)
      (p1 (p2 x))
    )
  )
)

(define caar
  (lambda (x)
    ((compose car car) x)
  )
)
(define cadr
  (lambda (x)
    ((compose car cdr) x)
  )
)
(define cdar
  (lambda (x)
    ((compose cdr car) x)
  )
)
(define cddr
  (lambda (x)
    ((compose cdr cdr) x)
  )
)
(define caaar
  (lambda (x)
    ((compose caar car) x)
  )
)
(define caadr
  (lambda (x)
    ((compose caar cdr) x)
  )
)
(define cadar
  (lambda (x)
    ((compose cadr car) x)
  )
)
(define caddr
  (lambda (x)
    ((compose cadr cdr) x)
  )
)
(define cdaar
  (lambda (x)
    ((compose cdar car) x)
  )
)
(define cdadr
  (lambda (x)
    ((compose cdar cdr) x)
  )
)
(define cddar
  (lambda (x)
    ((compose cddr car) x)
  )
)
(define cdddr
  (lambda (x)
    ((compose cddr cdr) x)
  )
)