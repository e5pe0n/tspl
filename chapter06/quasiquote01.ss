(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(print
  `(+ 2 3)
) ; (+ 2 3)
(print
  `(+ 2 ,(* 3 4))
) ; (+ 2 12)
(print
  `(a b (,(+ 2 3) c) d)
) ; (a b (5 c) d)
(print
  `(a b ,(reverse '(c d e)) f g)
) ; (a b (e d c) f g)
(print
  (let ([a 1] [b 2])
    `(,a . ,b)
  )
) ; (1 . 2)

(print
  `(+ ,@(cdr '(* 2 3)))
) ; (+ 2 3)
(print
  `(a b ,@(reverse '(c d e)) f g)
) ; (a b e d c f g)
(print
  (let ([a 1] [b 2])
    `(,a ,@b)
  )
) ; (1 . 2)
(print
  `#(,@(list 1 2 3))
) ; #(1 2 3)

(print
  '`,(cons 'a 'b)
) ; (quasiquote (unquote (cons (quote a) (quote b))))
(print
  `',(cons 'a 'b)
) ; (quote (a . b))
