;;;; ex 1.42 - f(g(x))

(define (square x)
  (* x x))

(define (inc x)
  (+ 1 x))

(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6);Value: 49
