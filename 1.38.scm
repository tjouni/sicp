;;;; ex 1.38 - approximate e

(define (cont-frac n d k)
  (define (denom times)
    (if (= times k) (/ (n times) (d times))
	(+ (d times) (/ (n (+ times 1)) (denom (+ times 1))))))
  (/ (n 1) (denom 1)))

(define (di n)
  (if (= (remainder n 3) 2) (+ 2 (* (floor (/ n 3)) 2))
      1))


(+ 2 (cont-frac (lambda (i) 1.0)
	   di
	   1000));Value: 2.7182818284590455

	

