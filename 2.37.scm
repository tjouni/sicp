;;;; ex 2.37 matrix algebra

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(define v (list 1 3 -5))
(define w (list 4 -2 -1))
(dot-product v w);Value: 3
(define m (list (list 1 2 3 4) (list 5 6 7 8)))
(define v (list 1 2 3 4))
(matrix-*-vector m v);Value 8: (30 70)
(define n (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))
(transpose n);Value 9: ((1 5 9) (2 6 10) (3 7 11) (4 8 12))
(define a (list (list 14 9 3) (list 2 11 15) (list 0 12 17) (list 5 2 3)))
(define b (list (list 12 25) (list 9 10) (list 8 5)))
(matrix-*-matrix a b);Value 10: ((273 455) (243 235) (244 205) (102 160))
