;;;; ex 1.32 - accumulate procedure

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (wallis-pi-term n)
  (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))

(define (even? n)
  (= (remainder n 2) 0))

(define (inc n)
  (+ n 1))

(* (accumulate * 1.0 wallis-pi-term 1 inc 10) 4);Value: 3.2751010413348065
(* (accumulate * 1.0 wallis-pi-term 1 inc 1000000) 4);Value: 3.141594224382854
