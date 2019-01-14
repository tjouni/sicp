;;;; ex 2.33 - list manipulation

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(map square (list 1 2 3 4));Value 3: (1 4 9 16)
(map sqrt (list 9 16 36 10000));Value 7: (3 4 6 100)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2 3 4) (list 8 9 10));Value 9: (1 2 3 4 8 9 10)

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(length (list 1 2 3));Value: 3
(length (list 1 2 3 4 5 6 7));Value: 7
