;;;; ex 1.30 - simpson integral approximation with iterative sum function

(define (simpson f a b n)
  (define h (/ (- b a) (* 1.0 n)))
  (define (simpson-term k)
    (define y (f (+ a (* 1.0 k h))))
    (if (or (= k 0) (= k n)) (* 1.0 y)
	(if (even? k) (* 2.0 y)
	    (* 4.0 y))))
  (* (/ h 3.0) (sum simpson-term 0 inc n)))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ 1 x))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(simpson cube 0.0 1 1000);Value: .25000000000000006


