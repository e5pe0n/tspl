(define interpret #f)
(let ()
  (define primitive-environment
    `(
      (apply . ,apply)
      (assq . ,assq)
      (call/cc . ,call/cc)
      (car . ,car)
      (cadr . ,cadr)
      (caddr . ,caddr)
      (caddr . ,caddr)
      (cddr . ,cddr)
      (cdr . ,cdr)
      (cons . ,cons)
      (eq? . ,eq?)
      (list . ,list)
      (map . ,map)
      (memv . ,memv)
      (null? . ,null?)
      (pair? . ,pair?)
      (read . ,read)
      (set-car! . ,set-car!)
      (set-cdr! . ,set-cdr!)
      (symbol? . ,symbol?)
    )
  )
  (define new-env
    (lambda (formals actuals env)
      (cond
        [(null? formals) env]
        [(symbol? formals) (cons (cons formals actuals) env)]
        [
          else
          (cons
            (cons (car formals) (car actuals))
            (new-env (cdr formals) (cdr actuals) env)
          )
        ]
      )
    )
  )
  (define lookup
    (lambda (var env)
      (cdr (assq var env))
    )
  )
  (define exec
    (lambda (exp env)
      (cond
        [(symbol? exp) (lookup exp env)]
        [
          (pair? exp)
          (case (car exp)
            [(quote) (cadr exp)]
            [
              (lambda)
              (lambda vals
                (let ([env (new-env (cadr exp) vals env)])
                  (let loop ([exps (cddr exp)])
                    (if (null? (cdr exps))
                      (exec (car exps) env)
                      (begin
                        (exec (car exps) env)
                        (loop (cdr exps))
                      )
                    )
                  )
                )
              )
            ]
            [
              (if)
              (if (exec (cadr expr) env)
                (exec (caddr expr) env)
                (exec (cadddr expr) env)
              )
            ]
            [
              (set!)
              (assign
                (cadr exp)
                (exec (caddr exp) env)
                env
              )
            ]
            [
              else
              (apply
                (exec (car exp) env)
                (map
                  (lambda (x) (exec x env))
                  (cdr exp)
                )
              )
            ]
          )
        ]
        [
          else exp
        ]
      )
    )
  )
  (set! interpret
    (lambda (exp)
      (exec exp primitive-environment)
    )
  )
)