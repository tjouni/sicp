;;;; ex 1.29 - simpson integral approximation

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term k)
    (define y (f (+ a (* 1.0 k h))))
    (if (or (= k 0) (= k n)) y
	(if (even? k) (* 2.0 y)
	    (* 4.0 y))))
  (* (/ h 3) (sum simpson-term a inc n)))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ 1 x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(simpson cube 0 1 100);Value: .24999999999999992
(simpson cube 0 1 1000);Value: .2500000000000003
