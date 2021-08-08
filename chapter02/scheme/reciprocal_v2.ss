(define reciprocal
  (lambda (n)
    (if (and (number? n) (not (= n 0)))
      (/ 1 n)
      (error  ; assertion-violation is introduced since r6rs
        "in reciprocal: improper argument"
        n
      )
    )
  )
)


(print (reciprocal .25))
(print (reciprocal 0))

; 4.0

; Error: in reciprocal: improper argument: 0

;         Call history:

;         <syntax>          (print (reciprocal 0.25))
;         <syntax>          (reciprocal 0.25)
;         <eval>    (print (reciprocal 0.25))
;         <eval>    (reciprocal 0.25)
;         <eval>    [reciprocal] (number? n)
;         <eval>    [reciprocal] (not (= n 0))
;         <eval>    [reciprocal] (= n 0)
;         <eval>    [reciprocal] (/ 1 n)
;         <syntax>          (print (reciprocal 0))
;         <syntax>          (reciprocal 0)
;         <eval>    (print (reciprocal 0))
;         <eval>    (reciprocal 0)
;         <eval>    [reciprocal] (number? n)
;         <eval>    [reciprocal] (not (= n 0))
;         <eval>    [reciprocal] (= n 0)
;         <eval>    [reciprocal] (error "in reciprocal: improper argument" n)     <--