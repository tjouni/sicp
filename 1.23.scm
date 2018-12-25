;;;; ex 1.23 - finding primes time complexity test with optimized find-divisor

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (next n)
  (if (= n 2)
      3
  (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes lower upper)
  (cond ((= (remainder lower 2) 0) (search-for-primes (+ 1 lower)
						      upper))
	((<= lower upper) (timed-prime-test lower)
	 (search-for-primes (+ 1 lower)
			    upper))
	(else lower)))

(search-for-primes 1000000000 1000000021); .02
(search-for-primes 10000000000 10000000061); .07
(search-for-primes 100000000000 100000000057); .19
(search-for-primes 1000000000000 1000000000063); .59
