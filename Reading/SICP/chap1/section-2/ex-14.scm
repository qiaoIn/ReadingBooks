; 换零钱方式的统计
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 50)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 5)))

(define (count-change amount)
  (define (cc amount kinds-of-coins)
    (newline)
    (display "amount:")
    (display amount)
    (newline)
    (display "kinds-of-coins:")
    (display kinds-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount (- kinds-of-coins 1))
                   (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))
  (cc amount 5))

(count-change 11)
