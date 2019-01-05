;;;; ex 2.30 - square-tree

(define (square-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (* tree tree))
	(else (cons (square-tree (car tree))
		    (square-tree (cdr tree))))))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)));Value 103: (1 (4 (9 16) 25) (36 49))
