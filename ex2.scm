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
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))

; trace reveals that:
; (sine 12.15) calles sine 5 times
; using trace on p reveals that the space complexity is the same since
; there is always a call to p waiting after every call to sine.

; 2.5 exponents

(define (simple-exp x n)
    (if (= n 0)
        1
        (* x (simple-exp x (- n 1)))))
; complexity: n space, n time

(define (iter-exp x n)
    (define (iter cnt acc)
        (if (<= cnt 0)
            acc
            (iter (- cnt 1) (* x acc))))
    (iter n 1))
; complexity: n time, 1 space

; 2.5.2
(define (fast-exp x n)
    (define (iter cnt acc)
        (cond ((>= cnt n) acc)
              ((and (not (= cnt 0)) (<= (* 2 cnt) n))
                    (iter (* 2 cnt) (* acc acc)))
              (else (iter (+ cnt 1) (* x acc)))))
    (iter 0 1))
