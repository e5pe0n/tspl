(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)


(define-syntax define-object
  (syntax-rules ()
    [
      (_ (name . varlist) ((var1 val1) ...) ((var2 val2) ...))
      (define name
        (lambda varlist
          (let* ([var1 val1] ...)
            (letrec ([var2 val2] ...)
              (lambda (msg . args)
                (case msg
                  [(var2) (apply var2 args)] ...
                  [
                    else
                    (error 'name "invalid message ~s" (cons msg args))
                  ]
                )
              )
            )
          )
        )
      )
    ]
    [
      (_ (name . varlist) ((var2 val2) ...))
      (define-object
        (name . varlist)
        ()
        ((var2 val2) ...)
      )
    ]
  )
)
(define-syntax send-message
  (syntax-rules ()
    [(_ obj msg arg ...) (obj 'msg arg ...)]
  )
)


(define-object (kons kar kdr pwd)
  ((count 0))
  (
    (get-car
      (lambda ()
        (set! count (+ count 1))
        kar
      )
    )
    (get-cdr
      (lambda ()
        (set! count (+ count 1))
        kdr
      )
    )
    (set-car!
      (lambda (x p)
        (if (string=? p pwd)
          (set! kar x)
        )
      )
    )
    (set-cdr!
      (lambda (x p)
        (if (string=? p pwd)
          (set! kdr x)
        )
      )
    )
    (accesses
      (lambda () count)
    )
  )
)

(define p (kons 'a 'b "magnificent"))
(print (send-message p get-car))  ; a
(print (send-message p get-cdr))  ; b
(print (send-message p accesses)) ; 2
(print (send-message p get-cdr))  ; b
(print (send-message p accesses)) ; 3
(newline)
(send-message p set-car! 'c "magnificent")
(print (send-message p get-car))  ; c
(send-message p set-car! 'd "please")
(print (send-message p get-car))  ; c