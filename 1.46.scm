;;;; ex 1.46 - iterative improvement

(define (square x)
  (* x x))

(define tolerance 0.00001)

(define (average a b)
  (/ (+ a b) 2))

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess) guess
    (iter (improve guess))))
  (lambda (guess) (iter guess)))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) 
       tolerance))
  ((iterative-improve good-enough? f) first-guess))

(sqrt 4);Value: 2.0000000929222947
(fixed-point cos 1.0);Value: .7390893414033928
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0);Value: 1.2587228743052672
