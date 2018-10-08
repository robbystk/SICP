; Week 5 SICP exercises
; Robby Stokoe

; 1.1 last pair

(define (last-pair l)
    (if (null? (cdr l))
        (car l)
        (last-pair (cdr l))))

; 1.2 reverse
(define (reverse l)
    (define (reverse-iter l acc)
        (if (null? (cdr l))
            (append (list (car l)) acc)
            (reverse-iter (cdr l) (append (list (car l)) acc))))
    (reverse-iter l (list)))
