;;;; ex 2.18 - reverse list procedure

(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items)) (list (car items)))))

(reverse (list 1 2 3 4));Value 46: (4 3 2 1)
