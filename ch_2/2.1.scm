;; ex 2.1 - better rational numbers

(define (make-rat n d)
  (let ((g (gcd d n)))
    (if (or (and (> n 0) (< d 0))
	    (and (< n 0) (> d 0)))
	(cons (* -1 (abs (/ n g))) (abs (/ d g)))
    (cons (abs (/ n g)) (abs (/ d g))))))

(define numer car)
(define denom cdr)

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(print-rat (make-rat 4 6));2/3
(print-rat (make-rat -4 6));-2/3
(print-rat (make-rat 4 -6));-2/3
(print-rat (make-rat -4 -6));2/3


