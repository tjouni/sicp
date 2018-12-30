;;;; ex 1.37 - continuous fraction approximation

(define tolerance 0.00001)

(define (cont-frac n d k)
  (define (denom times)
    (if (= times k) (/ (n times) (d times))
	(+ (d times) (/ (n (+ times 1)) (denom (+ times 1))))))
  (/ (n 1) (denom 1)))

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
	

