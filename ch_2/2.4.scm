;;;; ex 2.4 - procedural cons, car and cdr

(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

;; substitution model for car
(car (cons x y))
(car ((lambda (m) (m x y))))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y); = x

;; implementation of cdr

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 1 8));Value: 8
