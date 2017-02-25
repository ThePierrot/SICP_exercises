(define (last-pair list)
  (if (null? (cdr list)) 
      list
      (last-pair (cdr list))))

;test
(last-pair (list 1 2 3 4))
