;;;; ex 1.24 - finding primes time complexity test with fermat method

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define (square x)
  (* x x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  ;; try a 100 times
  (if (fast-prime? n 100)
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

(search-for-primes 1000000000000 1000000000063); too fast

