(define unify #f)

(let ()
  (define occurs?
    (lambda (u v)
      (and
        (pair? v)
        (let f ([lst (cdr v)])
          (and
            (pair? lst)
            (or
              (eq? u (car lst))
              (occurs? u (car lst))
              (f (cdr lst))
            )
          )
        )
      )
    )
  )
  (define sigma
    (lambda (u v s)
      (lambda (x)
        (let f ([x (s x)])
          (if (symbol? x)
            (if (eq? x u) v x)
            (cons (car x) (map f (cdr x)))
          )
        )
      )
    )
  )
  (define try-subst
    (lambda (u v s ks kf)
      (let ([u (s u)])
        (if (not (symbol? u))
          (uni u v s ks kf)
          (let ([v (s v)])
            (cond
              [(eq? u v) (ks s)]
              [(occurs? u v) (kf "cycle")]
              [else (ks (sigma u v s))]
            )
          )
        )
      )
    )
  )
  (define uni
    (lambda (u v s ks kf)
      (cond
        [(symbol? u) (try-subst u v s ks kf)]
        [(symbol? v) (try-subst v u s ks kf)]
        [
          (and
            (eq? (car u) (car v))
            (= (length u) (length v))
          )
          (let f ([u (cdr u)] [v (cdr v)] [s s])
            (if (null? u)
              (ks s)
              (uni
                (car u)
                (car v)
                s
                (lambda (s) (f (cdr u) (cdr v) s))
                kf
              )
            )
          )
        ]
        [else (kf "clash")]
      )
    )
  )
  (set! unify
    (lambda (u v)
      (uni
        uni
        v
        (lambda (x) x)
        (lambda (s) (s u))
        (lambda (msg) msg)
      )
    )
  )
)