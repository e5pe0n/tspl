(define write #f)
(define display #f)

(let ()
  (define wr
    (lambda (x d? p)
      (cond
        [(eof-object? x) (write-string "#<eof>" p)]
        [(port? x) (write-string "#<port>" p)]
        [(symbol? x) (write-string (symbol->string x) p)]
        [(pair? x) (wrpair x d? p)]
        [(number? x) (write-string (number->string x) p)]
        [(null? x) (write-string "()" p)]
        [(boolean? x) (write-string (if x "#t" "#f") p)]
        [(char? x) (if d? (write-char x p) (wrchar x p))]
        [(string? x) (if d? (write-string x p) (wrstring x p))]
        [(vector? x) (wrvector x d? p)]
        [(procedure? x) (write-string "#<procedure>" p)]
        [else (write-string "#<unknown>" p)] punknown
      )
    )
  )
  (define write-string
    (lambda (s p)
      (let ([n (string-length s)])
        (do ([i 0 (+ i 1)])
          ((= i n))
          (write-char (string-ref s i) p)
        )
      )
    )
  )
  (define wrpair
    (lambda (x d? p)
      (write-char #\( p)
      (let loop ([x x])
        (wr (car x) d? p)
        (cond
          [
            (pair? (cdr x))
            (write-char #\space p)
            (loop (cdr x))
          ]
          [(null? (cdr x))]
          [
            else
            (write-string " . " p)
            (wr (cdr x) d? p)
          ]
        )
      )
      (write-char #\) p)
    )
  )
  (define wrchar
    (lambda (x p)
      (case x
        [(#\newline) (write-string "#\\newline" p)]
        [(#\space) (write-string "#\\space" p)]
        [
          else
          (write-string "#\\" p)
          (write-char x p)
        ]
      )
    )
  )
  (define wrstring
    (lambda (x p)
      (write-char #\" p)
      (let ([n (string-length x)])
        (do ([i 0 (+ i 1)])
          ((= i n))
          (let ([c (string-ref x i)])
            (if (or (char=? c #\") (char=? c #\\))
              (write-char #\\ p)
            )
          )
        )
      )
      (write-char #\" p)
    )
  )
  (define wrvector
    (lambda (x d? p)
      (write-string "#(" p)
      (let ([size (vector-length x)])
        (if (not (= size 0))
          (let ([last (- size 1)])
            (let loop ([i 0])
              (wr (vector-ref x i) d? p)
              (if (not (= i last))
                (begin
                  (write-char #\space p)
                  (loop (+ i 1))
                )
              )
            )
          )
        )
      )
      (write-char #\) p)
    )
  )
  (set! write
    (lambda (x . rest)
      (if (null? rest)
        (wr x #f (current-output-port))
        (wr x #f (car rest))
      )
    )
  )
  (set! display
    (lambda (x . rest)
      (if (null? rest)
        (wr x #t (current-output-port))
        (wr x #t (car rest))
      )
    )
  )
)
