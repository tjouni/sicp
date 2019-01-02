;;;; ex 1.36 - x^x = 1000

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b)
  (/ (+ a b) 2))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2);33 steps to answer
(fixed-point (average-damp (lambda (x) (/ (log 1000) (log x)))) 2)
					;9 steps to answer with average-damp
