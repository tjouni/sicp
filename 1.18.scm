;;;; ex 1.18 - iterative logarithmic multiplication - russian peasant method

(define (double x) (+ x x))

(define (halve x)
  (cond ((< x 0) (ceiling(/ x 2)))
	(else (floor(/ x 2)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (mul a b)
  (define (iter a b x)
    (cond ((and (< a 0) (> b 0)) (iter b a x))
	  ((= a 0) x)
	  ((even? a) (iter (halve a) (double b) x))
	  (else (iter (halve a) (double b) (+ b x)))))
  (iter a b 0))

(mul 999 2);Value: 1998
(mul 0 0);Value: 0
(mul 1 0);Value: 0
(mul 0 1);Value: 0
(mul -8 3);Value: -24
(mul 987 654);Value: 645498
(mul 4 6);Value: 24
(mul 1 -1);Value: -1
