;;;; ex 2.41 - ordered triples sum

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (ordered-triples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k)
			       (list i j k))
			     (enumerate-interval (+ 1 j) n)))
		      (enumerate-interval (+ 1 i) n)))
	     (enumerate-interval 1 n)))

(define (sum-ordered-triples n s)
  (define (triple-sum? t)
    (= s (accumulate + 0 t)))
  (filter triple-sum? (ordered-triples n)))

(ordered-triples 4);Value 31: ((1 2 3) (1 2 4) (1 3 4) (2 3 4))
(sum-ordered-triples 6 12);Value 46: ((1 5 6) (2 4 6) (3 4 5))
