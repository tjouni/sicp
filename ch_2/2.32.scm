;;;; ex 2.32 - powerset

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (cons (car s) x)) rest)))))

(subsets (list 1 2 3))
					;Value 115: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
					;this works because it conses every value on list
					;to a list containing first the full list, then the cdr
					;of that list etc

