(define (move-rec n from to spare)
    (cond ((= n 0))
          (else (move-rec (- n 1) from spare to)
                (format #t "Move from ~A to ~A~N" from to)
                (move-rec (- n 1) spare to from))))
