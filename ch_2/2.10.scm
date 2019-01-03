;;;; ex 2.10 - interval arithmetic with zero divisor check

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (upper-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
      (error "ERROR: Division by an interval containing 0")
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))

(define (upper-bound x)
  (max (cdr x) (car x)))

(define (lower-bound x)
  (min (cdr x) (car x)))

(define i1 (make-interval 1 3))
(define i2 (make-interval 0 8))

(div-interval i1 i2);ERROR: Division by an interval containing 0
