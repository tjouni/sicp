;;;; ex 1.31 - product procedure

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
        (iter (next a) (* 1.0 (term a) result))))
  (iter a 1))

(define (wallis-pi-term n)
  (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))

(define (even? n)
  (= (remainder n 2) 0))

(define (inc n)
  (+ n 1))

(* (product wallis-pi-term 1 inc 10) 4);Value: 3.2751010413348065
(* (product wallis-pi-term 1 inc 1000000) 4);Value: 3.141594224382854
