; Week 5 SICP exercises
; Robby Stokoe

; 1.1 last pair

(define (last-pair l)
    (if (null? (cdr l))
        (car l)
        (last-pair (cdr l))))

