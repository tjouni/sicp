;;;; ex 1.11 recursive and linear processes of the same function

(define (a n)
     (if (< n 3)
	 n
	 (+ (a (- n 1))
	    (* 2 (a (- n 2)))
	    (* 3 (a (- n 3))))))

(a 1);Value: 1
(a 4);Value: 11
(a 5);Value: 25
(a 10);Value: 1892

(define (f n)
  (if (< n 3)
      n
  (iter-b 0 1 2 (- n 2))))


(define (iter-b j k l n)
  (if (= n 0)
      l
      (iter-b k l (+ (* 3 j)
		       (* 2 k)
		       l)
	      (- n 1))))

(f 2);Value: 2
(f 10);Value: 1892
(f 100);Value: 11937765839880230562825561449279733086
				
