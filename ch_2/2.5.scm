;;;; ex 2.5 - pair representation in integer form 2^a*3^b

(define (int-cons a b)
     (* (expt 2 a)
	(expt 3 b)))

(define (int-car p)
  (define (iter times p)
  (if (not (= (remainder p 2) 0)) times
      (iter (+ 1 times) (/ p 2))))
  (iter 0 p))

(define (int-cdr p)
  (define (iter times p)
  (if (not (= (remainder p 3) 0)) times
      (iter (+ 1 times) (/ p 3))))
  (iter 0 p))

(int-car (int-cons 2 3));Value: 2
(int-cdr (int-cons 2 3));Value: 3
(int-car (int-cons 78 90));Value: 78
(int-cdr (int-cons 78 90));Value: 90

