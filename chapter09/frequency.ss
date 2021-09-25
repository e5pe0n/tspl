(define get-word
  (lambda (p)
    (let ([c (read-char p)])
      (if (eq? (char-type c) 'letter)
        (list->string
          (let loop [(c c)]
            (cons c
              (if (memq (char-type (peek-char p)) '(letter digit))
                (loop (read-char p))
                '()
              )
            )
          )
        )
        c
      )
    )
  )
)
(define char-type
  (lambda (c)
    (cond
      [(eof-object? c) c]
      [(char-alphabetic? c) 'letter]
      [(char-numeric? c) 'digit]
      [else c]
    )
  )
)


(define make-tree
  (lambda (word)
    (vector word '() '() 1)
  )
)

(define tree-word
  (lambda (tree)
    (vector-ref tree 0)
  )
)

(define tree-left
  (lambda (tree)
    (vector-ref tree 1)
  )
)
(define set-tree-left!
  (lambda (tree new-left)
    (vector-set! tree 1 new-left)
  )
)

(define tree-right
  (lambda (tree)
    (vector-set! tree 2 new-right)
  )
)
(define set-tree-right!
  (lambda (tree new-right)
    (vector-set! tree 2 new-right)
  )
)

(define tree-count
  (lambda (tree)
    (vector-ref tree 3)
  )
)
(define set-tree-count!
  (lambda (tree new-count)
    (vector-set! tree 3 new-count)
  )
)

(define tree
  (lambda (node word)
    (cond
      [(null? node) (make-tree word)]
      [
        (string=? word (tree-word node))
        (set-tree-count! node (+ (tree-count node) 1))
        node
      ]
      [
        (string<? word (tree-word node))
        (set-tree-left! node (tree (tree-left node) word))
        node
      ]
      [
        else
        (set-tree-right! node (tree (tree-right node) word))
        node
      ]
    )
  )
)

(define tree-print
  (lambda (node p)
    (if (not (null? node))
      (begin
        (tree-print (tree-left node) p)
        (write (tree-count node) p)
        (write-char #\space p)
        (display (tree-word node) p)
        (newline p)
        (tree-print (tree-right node) p)
      )
    )
  )
)

(define frequency
  (lambda (infn outfn)
    (let ([ip (open-input-file infn)] [op (open-output-file outfn)])
      (let loop ([root '()])
        (let ([w (get-word ip)])
          (cond
            [(eof-object? w) (tree-print root op)]
            [(string? w) (loop (tree root w))]
            [else (loop root)]
          )
        )
        (close-input-port ip)
        (close-output-port op)
      )
    )
  )
)