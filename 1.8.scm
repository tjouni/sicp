;;;; 1.8 approximate cube roots

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(square 2);Value: 4
(square 0);Value: 0
(square -4);Value: 16

(define (abs x)
  (if (< x 0) (- x)
      x))

(abs -1);Value: 1
(abs 1);Value: 1

(define (improve guess x)
  (/ (+
      (/ x (square guess))
      (* 2 guess))
     3))

(define (good-enough? x guess)
  (< (abs (- (cube x) guess))
     0.0000000000001))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
		 x)))

(define (cube-root x)
  ((if (< x 0) - +)
   (cube-root-iter 1.0 (abs x))))

(cube-root 27);Value: 3.
(cube-root -2);Value: -1.2599210498948732
(cube-root 0.00001);Value: 2.1544346925573252e-2
(cube-root 1);Value: 1.
(cube-root 3);Value: 1.4422495703074085
