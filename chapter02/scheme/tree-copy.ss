(define print
  (lambda (x)
    (for-each display `(,x, "\n"))
  )
)

(define tree-copy
  (lambda (tr)
    (if (not (pair? tr))
      tr
      (cons (tree-copy (car tr))
            (tree-copy (cdr tr)))
    )
  )
)

(print
  (let ([copy (tree-copy `((a . b) . c))])
    copy
  )
)

; ((a . b) . c)