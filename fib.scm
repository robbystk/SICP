(define (fib n)
    (define (next iter cur prev)
        (if (>= iter n)
            cur
            (next (+ 1 iter)
                  (+ cur prev)
                  cur)))
    (next 0 0 1))
