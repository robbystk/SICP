; Week three exercises
; Robby Stokoe

; 2.6 Returning procedures
(define (double f)
    (lambda (x) (f (f x))))

(define (inc n)
    (+ n 1))

; (((double (double double)) inc) 5)
; returns 21 which I think is correct
