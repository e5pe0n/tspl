(define print
  (lambda (x)
    (for-each display `(,x "\n"))
  )
)

(define make-queue
  (lambda ()
    (let ([end (cons 'ignored `())])
      (cons end end)
    )
  )
)

(define putq!
  (lambda (q v)
    (let ([end (cons 'ignored `())])
      (set-car! (cdr q) v)
      (set-cdr! (cdr q) end)
      (set-cdr! q end)
    )
  )
)

(define emptyq?
  (lambda (q)
    (eqv? (car q) (cdr q))
  )
)

(define getq
  (lambda (q)
    (if (emptyq? q)
      (error "queue is empty!")
      (car (car q))
    )
  )
)

(define delq!
  (lambda (q)
    (if (emptyq? q)
      (error "queue is empty!")
      (set-car! q (cdr (car q)))
    )
  )
)

(define myq (make-queue))

(print (emptyq? myq)) ; #t
(putq! myq 'a)
(print (emptyq? myq)) ; #f
(print (getq myq))  ; a
(delq! myq)
(print (emptyq? myq)) ; #t
(delq! myq)

; Error: queue is empty!

;         Call history:

;         <syntax>          (print (emptyq? myq))
;         <syntax>          (emptyq? myq)
;         <eval>    (print (emptyq? myq))
;         <eval>    (emptyq? myq)
;         <eval>    [emptyq?] (eqv? (car q) (cdr q))
;         <eval>    [emptyq?] (car q)
;         <eval>    [emptyq?] (cdr q)
;         <eval>    [print] (for-each display (quasiquote ((unquote x) "\n")))
;         <eval>    [print] (##sys#list x (##core#quote "\n"))
;         <syntax>          (delq! myq)
;         <eval>    (delq! myq)
;         <eval>    [delq!] (emptyq? q)
;         <eval>    [emptyq?] (eqv? (car q) (cdr q))
;         <eval>    [emptyq?] (car q)
;         <eval>    [emptyq?] (cdr q)
;         <eval>    [delq!] (error "queue is empty!")     <--