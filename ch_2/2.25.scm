;;;; ex 2.25 - pick 7 from list

(define list1 (list 1 3 (list 5 7) 9))

(define list2 (list (list 7)))

(define list3
  (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

;; list1 (1 3 (5 7) 9)
;; list2 ((7))
;; list3 (1 (2 (3 (4 (5 (6 7))))))

(cadr (caddr list1));Value: 7
(caar list2);Value: 7
(cadr (cadr (cadr (cadr (cadr (cadr list3))))));Value: 7
