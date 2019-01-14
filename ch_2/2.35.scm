;;;; ex 2.35 - count leaves with accumulate

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate +
	      0
	      (map (lambda (x) 1)
		   (enumerate-tree t))))

(count-leaves (list));Value: 0
(count-leaves (list 1 2));Value: 2
(count-leaves (list 1 (list 2 3 4)));Value: 4
(count-leaves (list (list 1 2) (list 3 4 5) 6));Value: 6
(count-leaves (list (list 1 2 3) (list 4 5 (list 6 7))));Value: 7
