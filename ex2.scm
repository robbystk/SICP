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

; 2.3 Pascal's triangle
(define (pascal i j)
    (if (or (= i 0) (= j 0))
        1
        (+ (pascal (- i 1) j) (pascal j (- j 1)))))

; 2.4 sines

; 2.5 exponents
