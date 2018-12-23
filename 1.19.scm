;;;; ex 1.19 - logarithmic time fibonacci numbers

(define (square n)
  (* n n))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (even? a)
  (= (remainder a 2) 0))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (square p) (square q))
		   (+ (* 2 p q) (square q))
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))

(fib 2);Value: 1
(fib 3);Value: 2
(fib 100);Value: 354224848179261915075
