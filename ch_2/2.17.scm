;;;; ex 2.17 - last-pair procedure

(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(last-pair (list 23 72 149 34));Value: 34
