; 1.1 and 1.2 are fairly trivial

; 1.3 sum the squares
(define (sum-sq-largest a b c)
    (define (square x) (* x x))
    (define (sum-sq a b)
        (+ (square a) (square b)))
    (define (smallest a b)
        (if (> a b) b a))
    (define (smallest-of-three a b c)
        (smallest a (smallest b c)))
    (cond ((= a (smallest-of-three a b c)) (sum-sq b c))
          ((= b (smallest-of-three a b c)) (sum-sq a c))
          ((= c (smallest-of-three a b c)) (sum-sq a b))))

; 1.4
; test for order of evaluation
; applicative: apply innermost procedures first, until they become primitives,
; then apply next-higher procedures
; e.g. applicative:
; (+ (square (+ 5 1)) (square (* 5 2)))
; (+ (square 6) (square 10))
; (+ 36 100)
; 136
; normal: expand procedures by substituting in their definitions, then evaluate
; e.g. normal:
; (+ (square (+ 5 1)) (square (* 5 2)))
; (+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2))) ; now fully primitive
; (+ (* 6 6) (* 10 10))
; (+ 36 100)
; 136

; test for evaluation order:
(define (p) (p))
(define (test x y)
    (if (= x 0)
        0
        y))
; (test 0 (p))  ; this makes csi hang, so it's apparently using applicative order

; applicative order:
; (test 0 (p))  ; expand p
; (test 0 (p))  ; expand p
; (test 0 (p))  ; uh-oh

; normal order
; (test 0 (p))
; (if (= 0 0) 0 (p))    ; expand (= 0 0) and (p)
; (if TRUE 0 (p))       ; (p) does not change
; 0                     ; (if TRUE x y) reduces to x

; 1.5
; see sqrt.scm for Heron's algorithm
; I did not do Newton's method or redefining if
; apparently redefined if is evaluated differently making the algorithm recursive

; 1.5.2
; for large floating points you can't get within arbitrary precision of things
; so the precision needs to be variable based on the magnitude of the number.
; One way to check is to look for small changes between current and previous
; iteration, but they have to be relatively small, rather than absolutely small.
