;;;; ex 1.27 - seeing that the carmichael numbers fool the fermat test

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n a)
  (define (try-it a)
    (= (expmod a n n) a))
  (cond ((or (= a n) (try-it a)) (try-it (+ 1 a)))
  (else false)))

(define (square x)
  (* x x))

(fermat-test 32174215327 1);Value: #t
(fermat-test 3 1);Value: #t
(fermat-test 1000000000 1);Value: #f

;; carmichael numbers

(fermat-test 561 1)
(fermat-test 1105 1)
(fermat-test 1729 1)
(fermat-test 2465 1)
(fermat-test 2821 1)
(fermat-test 6601 1); all true
