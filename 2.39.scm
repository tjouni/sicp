;;;; ex 2.39 - reverse by folding

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(reverse (list 1 2 3 4));Value 27: (4 3 2 1)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(reverse (list 1 2 3 4));Value 28: (4 3 2 1)
