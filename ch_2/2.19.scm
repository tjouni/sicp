;;;; ex 2.19 - improved coin change counter

(define (cc amount coin-values)
  (define (first-denomination l)
    (car l))
  (define (except-first-denomination l)
    (cdr l))
  (define (no-more? l)
    (null? l))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else 
         (+ (cc amount
		(except-first-denomination coin-values))
            (cc (- amount
		   (first-denomination coin-values))
                coin-values)))))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins);Value: 292
(cc 100 uk-coins);Value: 104561

(define reverse-us-coins (list 1 5 10 25 50))

(cc 100 reverse-us-coins);Value: 292, order does not affect result
