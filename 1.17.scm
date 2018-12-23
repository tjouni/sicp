;;;; ex 1.17 - logarithmic multiplication

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (mul a b)
  (cond ((or (= a 0) (= b 0)) 0)
	((= b 1) a)
	((even? b) (mul (double a) (halve b)))
	(else (+ a (mul a (- b 1))))))


(mul 999 2);Value: 1998
(mul 0 0);Value: 0
(mul 1 0);Value: 0
(mul 0 1);Value: 0
(mul -8 3);Value: -24
(mul 987 654);Value: 645498
