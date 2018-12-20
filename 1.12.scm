;;;; ex 1.12 - pascal's triangle

(define (pascal row column)
  (cond ((> column row) 0)
        ((= row 1) 1)
	((= column 0) 1)
	((= column row) 1)
	(else (+ (pascal (- row 1) (- column 1))
		 (pascal (- row 1) column)))))

(pascal 6 3);Value: 20
(pascal 0 1);Value: 0
(pascal 0 0);Value: 1
(pascal 2 1);Value: 2
(pascal 5 2);Value: 10
(pascal 5 3);Value: 10
(pascal 5 4);Value: 5
(pascal 6 2);Value: 15
(pascal 6 3);Value: 20
(pascal 20 12);Value: 125970
