;;;; ex 1.44 - n-fold smoothed function

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (even? x)
  (= (remainder x 2) 0))

(define (repeated f n)
  (cond ((= n 1) f)
	((even? n) (compose (repeated f (/ n 2))
			    (repeated f (/ n 2))))
	(else (compose f (repeated f (- n 1))))))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
		    (f x)
		    (f (+ x dx)))
		 3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(square 7.8234);Value: 61.205587560000005
((smooth square) 7.8234);Value: 61.20558756006667
((n-fold-smooth square 2) 7.8234);Value: 61.205587560133345
((n-fold-smooth square 8) 7.8234);Value: 61.20558756053333
((n-fold-smooth square 16) 7.8234);Value: 61.205587561066636


