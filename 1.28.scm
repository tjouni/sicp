;;;; ex 1.28 - miller-rabin test for primes

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (sqrtest (expmod base (/ exp 2) m)
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (miller-rabin n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((miller-rabin n) (fast-prime? n (- times 1)))
	(else false)))

(define (sqrtest a m)
  (let ((value (remainder (square a) m)))
  (cond ((and (= value 1) (not (= a 1)) (not (= a (- m 1))) 0))
	(else value))))

(define (square x)
  (* x x))

(define (prime? n)
  (cond ((= n 2) true)
	((even? n) false)
	(else (fast-prime? n 100))))

(prime? 32174215327);Value: #t
(prime? 3);Value: #t
(prime? 1000000000);Value: #f
(prime? 2);Value: #t
(prime? 48);Value: #f

;; carmichael numbers

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601); all false so it works
