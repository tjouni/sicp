;;;; ex 2.34 - horner's rule

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
		(+ (* x higher-terms) this-coeff))
	      0
	      coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1));Value: 79
(horner-eval 13 (list 1 3 0 5 0 1 2 2 2));Value: 1766994412
