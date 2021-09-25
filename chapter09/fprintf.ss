(define printf #f)
(define fprintf #f)

(let ()
  (define dofmt
    (lambda (p cntl args)
      (let ([nmax (- (string-length cntl) 1)])
        (let loop ([n 0] [a args])
          (if (<= n nmax)
            (let ([c (string-ref cntl n)])
              (if (and (char=? c #\~) (< n nmax))
                (case (string-ref cntl (+ n 1))
                  [
                    (#\a #\A)
                    (display (car a ) p)
                    (loop (+ n 2) (cdr a))
                  ]
                  [
                    (#\s #\S)
                    (write (car a ) p)
                    (loop (+ n 2) (cdr a))
                  ]
                  [
                    (#\%)
                    (newline p)
                    (loop (+ n 2) a)
                  ]
                  [
                    (#\~)
                    (write-char #\~ p)
                    (loop (+ n 2) a)
                  ]
                  [
                    else
                    (write-char c p)
                    (loop (+ n 1) a)
                  ]
                )
                (begin
                  (write-char c p)
                  (loop (+ n 1) a)
                )
              )
            )
          )
        )
      )
    )
  )
  (set! printf
    (lambda (control . args)
      (dofmt (current-output-port) control args)
    )
  )
  (set! fprintf
    (lambda (p control . args)
      (dofmt p control args)
    )
  )
)