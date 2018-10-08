;;; Scheme code for Twenty-One Simulator [PS2 Fall '90]

(define (twenty-one player-strategy house-strategy)
  (let ((house-initial-hand (make-new-hand (deal))))
    (let ((player-hand
           (play-hand player-strategy
                      (make-new-hand (deal))
                      (hand-up-card house-initial-hand))))
      (if (> (hand-total player-hand) 21)
          0                                ; ``bust'': player loses
          (let ((house-hand 
                 (play-hand house-strategy
                            house-initial-hand
                            (hand-up-card player-hand))))
            (cond ((> (hand-total house-hand) 21)
                   1)                      ; ``bust'': house loses
                  ((> (hand-total player-hand)
                      (hand-total house-hand))
                   1)                      ; house loses
                  (else 0)))))))           ; player loses

(define (play-hand strategy my-hand opponent-up-card)
  (cond ((> (hand-total my-hand) 21) my-hand) ; I lose... give up
        ((strategy my-hand opponent-up-card) ; hit?
         (play-hand strategy
                    (hand-add-card my-hand (deal))
                    opponent-up-card))
        (else my-hand)))                ; stay


(define (deal) (new-card
    (+ 1 (random 10))
    (list-ref (list 'clubs 'hearts 'diamonds 'spades) (random 4))))

; card contains a value (number) and suit (symbol)
(define (new-card value suit)
    (cons value suit))

(define (card-value card)
    (car card))

(define (card-suit card)
    (cdr card))

; A hand is a list of cards.  The first card is the one facing up
(define (make-new-hand first-card)
  (list first-card))

(define (hand-add-card hand card)
  (append hand (list card)))

(define (hand-up-card hand)
  (car hand))

(define (hand-total hand)
    (define (total-iter hand counter)
        (if (null? hand)
        counter
        (total-iter (cdr hand) (+ counter (card-value (car hand))))))
    (total-iter hand 0))

(define (hit? your-hand opponent-up-card)
  (newline)
  (display "Opponent up card ")
  (display opponent-up-card)
  (newline)
  (display "Your Total: ")
  (display (hand-total your-hand))
  (newline)
  (display "Hit? ")
  (user-says-y?))

(define (user-says-y?) (string=? (read-line) "y"))

(define (stop-at n)
    (lambda (your-hand opponent-up-card)
        (< (hand-total your-hand) n)))

(define (test-strategy player-strategy house-strategy n)
    (define (iter tot step)
        (if (>= step n)
            tot
            (iter (+ tot (twenty-one player-strategy house-strategy))
                (+ 1 step))))
    (iter 0 0))

(define (watch-player strategy)
    (lambda (your-hand opponent-up-card)
        (format #t "~nOpponent up card ~a~n" opponent-up-card)
        (format #t "Your Total: ~a~n" (hand-total your-hand))
        (let ((result (strategy your-hand opponent-up-card)))
            (if result
                (display "Hit")
                (display "Stay"))
            (newline)
            result)))

(define (agree strat-one strat-two)
    (lambda (your-hand opponent-up-card)
        (and (strat-one your-hand opponent-up-card)
            (strat-two your-hand opponent-up-card))))

(define (hybrid combiner strat-one strat-two)
    (lambda (your-hand opponent-up-card)
        (combiner (strat-one your-hand opponent-up-card)
            (strat-two your-hand opponent-up-card))))
