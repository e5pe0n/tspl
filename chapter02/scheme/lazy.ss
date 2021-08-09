(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define lazy
  (lambda (t)
    (let ([val #f] [flag #f])
      (lambda ()
        (if (not flag)
          (begin (set! val (t))
                 (set! flag #t))
        )
        val
      )
    )
  )
)

(define p
  (lazy
    (lambda ()
      (print "Ouch!")
      "got me"
    )
  )
)
(print (p))
; Ouch!
; got me
(print (p))
; got me