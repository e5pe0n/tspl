(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define shhh #f)
(define tell #f)

(let ([secret 0])
  (set! shhh
    (lambda (message)
      (set! secret message)
    )
  )
  (set! tell
    (lambda ()
      secret
    )
  )
)

(shhh "sally likes harry")
(print (tell))  ; sally likes harry