;;;; ex 2.3 - two representations of rectangles

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define make-point cons)
(define x-point car)
(define y-point cdr)


;; universal procedures for perimeter
;; and area
(define (rect-perimeter r)
  (+ (* 2 (rect-a r))
     (* 2 (rect-b r))))

(define (rect-area r)
  (* (rect-a r)
     (rect-b r)))

;; first representation
;; a rectangle starting at (0,0) that
;; has height b and width a
(define (make-rect a b)
  (cons (make-segment (make-point 0 0)
		      (make-point 0 b))
	(make-segment (make-point 0 0)
		      (make-point a 0))))

(define rect-a caddr)
(define rect-b cddar)

(rect-perimeter (make-rect 3 2));Value: 10
(rect-area (make-rect 8 2));Value: 16

;; second representation
;; a rectangle defined by two segments
;; provided by user (no error checking)
(define (make-rect seg1 seg2)
  (cons seg1 seg2))

(define (rect-a rect)
  (let ((xdist (abs (- (x-point (start-segment (car rect)))
		       (x-point (end-segment (car rect))))))
	(ydist (abs (- (y-point (start-segment (car rect)))
		       (y-point (end-segment (car rect)))))))
	(cond ((= xdist 0) ydist)
	      ((= ydist 0) xdist)
	      (else (sqrt (+ (square xdist)
			     (square ydist)))))))

(define (rect-b rect)
  (let ((xdist (abs (- (x-point (start-segment (cdr rect)))
		       (x-point (end-segment (cdr rect))))))
	(ydist (abs (- (y-point (start-segment (cdr rect)))
		       (y-point (end-segment (cdr rect)))))))
	(cond ((= xdist 0) ydist)
	      ((= ydist 0) xdist)
	      (else (sqrt (+ (square xdist)
			     (square ydist)))))))

(define test-rect (make-rect (make-segment (make-point 1 1)
					 (make-point 1 3))
			     (make-segment (make-point 1 1)
					 (make-point 8 1))))

(rect-area test-rect);Value: 14
(rect-perimeter test-rect);Value: 18

(define test-rect2 (make-rect (make-segment (make-point 0 0)
					    (make-point -1 1))
			      (make-segment (make-point 0 0)
					    (make-point 1 1))))

(rect-area test-rect2);Value: 2.0000000000000004
(rect-perimeter test-rect2);Value: 5.656854249492381
