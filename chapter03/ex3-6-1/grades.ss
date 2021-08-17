(module grades (gpa->grade gpa letter->number filter)
  (import scheme)
  (import (chicken base))

  (define in-range?
    (lambda (x n y)
      (and (>= n x) (< n y))
    )
  )
  (define-syntax range-case
    (syntax-rules (- else)
      [
        (_ expr ((x - y) e1 e2 ...) ... [else ee1 ee2 ...])
        (let ([tmp expr])
          (cond
            [(in-range? x tmp y) e1 e2 ...]
            ...
            [else ee1 ee2 ...]
          )
        )
      ]
      [
        (_ expr ((x - y) e1 e2 ...) ...)
        (let ([tmp expr])
          (cond
            [(in-range? x tmp y) e1 e2 ...]
            ...
          )
        )
      ]
    )
  )
  (define letter->number
    (lambda (x)
      (case x
        [(a) 4.0]
        [(b) 3.0]
        [(c) 2.0]
        [(d) 1.0]
        [(f) 0.0]
        [else (error "invalid letter grade" x)]
      )
    )
  )
  (define filter
    (lambda (ls f)
      (if (null? ls)
        `()
        (if (f (car ls))
          (cons (car ls) (filter (cdr ls) f))
          (filter (cdr ls) f)
        )
      )
    )
  )
  (define gpa->grade
    (lambda (x)
      (range-case x
        [(0.0 - 0.5) 'f]
        [(0.5 - 1.5) 'd]
        [(1.5 - 2.5) 'c]
        [(2.5 - 3.5) 'b]
        [else 'a]
      )
    )
  )
  (define-syntax gpa
    (syntax-rules ()
      [
        (_ g1 g2 ...)
        (let ([ls (map letter->number (filter `(g1 g2 ...) (lambda (x) (not (eqv? x 'x)))))])
          (if (null? ls)
            0.0
            (/ (apply + ls) (length ls))
          )
        )
      ]
    )
  )
)