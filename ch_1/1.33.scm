;;;; ex 1.33 - filtered-accumulate

(define (filtered-accumulate combiner filter null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(if (filter a)
            (iter (next a) (combiner (term a) result))
	    (iter (next a) result))))
  (iter a null-value))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (if (= n 1) false
  (= (smallest-divisor n) n)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (identity x)
  x)

(define (square x)
  (* x x))

(define (inc n)
  (+ n 1))

(define (relative-prime?)
  (= (gcd )))

(define (sum-of-prime-squares a b)
  (filtered-accumulate + prime? 0 square a inc b))

(define (product-of-relative-primes n)
  (define (relative-filter? x)
    (= (gcd x n) 1))
  (filtered-accumulate * relative-filter? 1 identity 1 inc n))

(sum-of-prime-squares 1 10);Value: 87
(product-of-relative-primes 10);Value: 189

