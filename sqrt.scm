(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x))
    )   
)

(define (good-enqugh? guess x)
    (< (abs (- (square guess) x)) 0.001)
)

(define (abs x)
    (if (< x 0)
        (- x)
        x
    )
)

(define (square x)
    (* x x)
)

(define (sqrt x)
    (sqrt-iter x x)
)

(let ((arg (car (command-line-arguments))))
    (display (string-append (number->string (sqrt (string->number arg))) "\n"))
)
