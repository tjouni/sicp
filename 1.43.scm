;;;; ex 1.43 - repeated function

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeat f times)
    (cond ((= times 1) (lambda (x) (f x)))
	  (else (repeat (lambda (x) ((compose f f) x)) (- times 1)))))
  (repeat f n))
    
((repeated square 2) 5);Value: 625
