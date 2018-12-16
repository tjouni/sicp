;;;; 1.7 approximate square roots

(define (square x)
  (* x x))

(square 2);Value: 4
(square 0);Value: 0
(square -4);Value: 16

(define (abs x)
  (if (< x 0) (- x)
      x))

(abs -1);Value: 1
(abs 1);Value: 1

(define (average x y)
  (/ (+ x y) 2))

(average 1000.0 1);Value: 500.5
(average -2 1.0);Value: -.5

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (<
     (/
      (abs (- guess
	      (improve guess x)))
      guess)
     0.00001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.00001);Value: 3.1622926477232706e-3
(sqrt 999999999);Value: 31622.780573087948
