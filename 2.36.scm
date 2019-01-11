;;;; ex 2.36 - accumulate-n

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(define s (list (list 1 2 3)
		(list 4 5 6)
		(list 7 8 9)
		(list 10 11 12)));((1 2 3) (4 5 6) (7 8 9) (10 11 12))

(accumulate-n + 0 s);Value 18: (22 26 30)
(accumulate-n * 1 s);Value 20: (280 880 1944)
