;;;; ex 2.21 - two flavors of square-list

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))
	    (square-list (cdr items)))))

(square-list (list 1 2 3 4 5 6));Value 70: (1 4 9 16 25 36)

(define (square-list2 items)
  (map square items))

(square-list2 (list 1 2 3 4 5 6));Value 71: (1 4 9 16 25 36)

