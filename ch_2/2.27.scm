;;;; ex 2.27 - deep reverse procedure

(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items)) (list (car items)))))

(reverse (list 1 2 3 4));Value 46: (4 3 2 1)

(define (deep-reverse items)
  (if (null? items)
      items
      (if (pair? (car items))
	  (append (deep-reverse (cdr items))
		  (list (deep-reverse (car items))))
	  (append (deep-reverse (cdr items))
		  (list (car items))))))

(define x (list (list 1 2) (list 3 4)))
(reverse x);Value 83: ((3 4) (1 2))
(deep-reverse x);Value 89: ((4 3) (2 1))


