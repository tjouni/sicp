;;;; ex 2.29 - binary mobile

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
	((not (pair? mobile)) mobile)
	(else (+ (total-weight (branch-structure
				(left-branch mobile)))
		 (total-weight (branch-structure
				(right-branch mobile)))))))

(define weight-test (make-mobile (make-branch 2 4) (make-branch 2 9))) 
(total-weight weight-test);Value: 13

(define (torque branch)
  (* (total-weight (branch-structure branch)) (branch-length branch)))

(define (balanced? mobile)
  (if (not (pair? mobile)) #t
      (and (= (torque (left-branch mobile))
	      (torque (right-branch mobile)))
	   (balanced? (branch-structure (left-branch mobile)))
	   (balanced? (branch-structure (right-branch mobile))))))

(define m2 (make-mobile 
             (make-branch 4 6) 
             (make-branch 2 
                          (make-mobile 
                           (make-branch 5 8) 
                           (make-branch 10 4)))))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(define c (make-mobile (make-branch 5 a) (make-branch 3 b)))
(define d (make-mobile (make-branch 4 a) (make-branch 4 a)))
(total-weight a);Value: 6
(total-weight b);Value: 8
(total-weight c);Value: 14
(total-weight d);Value: 12
(balanced? a);Value: #t
(balanced? b);Value: #f
(balanced? c);Value: #f
(balanced? d);Value: #t
