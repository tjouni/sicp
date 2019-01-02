;;;; ex 1.39 - approximate tangent 

(define (cont-frac n d k)
  (define (denom times)
    (if (= times k) (/ (n times) (d times))
	(- (d times) (/ (n (+ times 1)) (denom (+ times 1))))))
  (/ (n 1) (denom 1)))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x) (* x x))
	     (lambda (i) (- (* 2.0 i) 1))
	     k))

(tan-cf 1 10);Value: 1.5574077246544789
