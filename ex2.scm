; weej 2 exercises for CSU SICP
; Robby Stokoe

; 2.1: FizzBuzz
(define (fb n)
    (define (print-fb x)
        (cond ((and (= (modulo x 3) 0) (= (modulo x 5) 0))
                  (format #t "FizzBuzz~N"))
              ((= (modulo x 3) 0) (format #t "Fizz~N"))
              ((= (modulo x 5) 0) (format #t "Buzz~N"))
              (else (format #t "~A~N" x))))
    (define (iter cnt)
        (if (<= cnt n)
            (begin (print-fb cnt) (iter (+ 1 cnt)))
            0))
    (iter 0))
            

; 2.2 recursion and iteration
; f(n) = {n,                            n < 3
;        {f(n) + 2f(n-1) + 3f(n-3),     n >= 3

; recursive
(define (recur-f n)
    (if (< n 3)
        n
        (+ (recur-f (- n 1)) (* 2 (recur-f (- n 2))) (* 3 (recur-f (- n 3))))))

; iterative
(define (iter-f n)
    (define (iter cur prev pprev cnt)
        (if (>= cnt n)
            cur
            (iter (+ cur (* 2 prev) (* 3 pprev))
                  cur
                  prev
                  (+ 1 cnt))))
    (if (< n 3)
        n
        (iter 2 1 0 2)))

; 2.3 Pascal's triangle
; this takes row and column with the triangle tipped 45 degrees
(define (pascal i j)
    (if (or (= i 0) (= j 0))
        1
        (+ (pascal (- i 1) j) (pascal j (- j 1)))))

; alternative version taking row and 'column' of normal-orientation triangle
(define (pascal-alt n k)
    (cond ((or (< k 0) (> k n)) 0)
          ((or (= k 0) (= k n)) 1)
          (else (+
                    (pascal (- n 1) k)
                    (pascal (- n 1) (- k 1))))))

; 2.4 sines

; 2.5 exponents
