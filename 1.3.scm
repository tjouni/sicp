;;;; exercise 1.3

(define (square x) (* x x))
(square 21)
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 2 8)

(define (square-sum-largest x y z)
  (cond ((and (>= x y) (>= y z) (sum-of-squares x y)))
        ((and (>= y x) (>= z y) (sum-of-squares y z)))
	((and (>= x y) (>= z y) (sum-of-squares x z)))))
	     
(square-sum-largest 1 2 3);Value: 13
(square-sum-largest 1 1 1);Value: 2
(square-sum-largest 4 2 1);Value: 20
(square-sum-largest 5 0 2);Value: 29
(square-sum-largest 9 1 1);Value: 82

