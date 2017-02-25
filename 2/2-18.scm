(define (last-pair list)
  (if (null? (cdr list)) 
      list
      (last-pair (cdr list))))

(define (reverse-list list)
  (if (null? list)
      (list)
      (append (reverse (cdr list))
              (car list))))

(reverse-list (list 1 2 3 4 5))