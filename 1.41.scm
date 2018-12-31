;;;; ex 1.41 - double procedure

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ 1 x))

(((double (double double)) inc) 5);Value: 21
