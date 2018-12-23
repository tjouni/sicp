;;;; ex 1.16 - iterative exponential calculator

(define (exp b n)
  (exp-iter b n 1))

(define (exp-iter b n a)
  (cond ((= n 1) (* b a))
	((= n 0) 1)
	((even? n) (exp-iter b (/ n 2) (* a (exp-iter b (/ n 2) 1))))
	(else (exp-iter b (- n 1) (* a b)))))

(define (even? n)
  (= (remainder n 2) 0))

(exp 2 9);Value: 512
(exp 0 8);Value: 0
(exp 2 20);Value: 1048576
(exp 3 21);Value: 10460353203
(exp 98 0);Value: 1
