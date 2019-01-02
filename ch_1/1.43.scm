;;;; ex 1.43 - repeated function

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (cond ((= n 1) f)
	((even? n) (compose (repeated f (/ n 2))
			    (repeated f (/ n 2))))
	(else (compose f (repeated f (- n 1))))))
    
((repeated square 2) 5);Value: 625
