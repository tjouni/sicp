;;;; ex 1.45 - repeated average damping for nth roots

(define (square x)
  (* x x))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b)
  (/ (+ a b) 2))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (even? x)
  (= (remainder x 2) 0))

(define (repeated f n)
  (cond ((= n 1) f)
	((even? n) (compose (repeated f (/ n 2))
			    (repeated f (/ n 2))))
	(else (compose f (repeated f (- n 1))))))

(define (nth-root x n)
  (fixed-point ((repeated average-damp (floor (/ (log n) (log 2))))
	       (lambda (y) (/ x (expt y (- n 1)))))
	       1.0))

(nth-root 4 2);Value: 2.000000000000002
(nth-root 268435456 28);Value: 1.9999957943905209
(nth-root 4294967296 32);Value: 2.000000000000006
