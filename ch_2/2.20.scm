;;;; ex 2.20 - same parity procedure

(define (same-parity a . l)
  (let ((r (remainder a 2)))
    (define (iter-list old-list new-list)
      (if (null? old-list) new-list
	     (if (= r (remainder (car old-list) 2))
		 (iter-list (cdr old-list)
			    (append new-list (list (car old-list))))
		 (iter-list (cdr old-list)
			    new-list))))
    (iter-list l (list a))))

(same-parity 2 3 4 5 6 7);Value 67: (2 4 6)
(same-parity 1 2 3 4 5 6 7);Value 68: (1 3 5 7)
