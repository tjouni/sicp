;;;; ex 2.28 - fringe procedure

(define (fringe x)
  (cond ((null? x) '())
	((not (pair? x)) (list x))
	(else (append (fringe (car x)) (fringe (cdr x))))))

(define x (list (list 1 2) (list 3 4)))

(fringe x);Value 96: (1 2 3 4)
(fringe (list x x));Value 97: (1 2 3 4 1 2 3 4)
