(define (my-equal? l1 l2)
  (define (equal?-iter l1 l2)
    (if (null? l1)
        #t
        (if (eq? (car l1) (car l2))
            (equal?-iter (cdr l1) (cdr l2))
            #f)))
  (if (not (= (length l1) (length l2)))
      #f
      (equal?-iter l1 l2)))

(my-equal? '(1 2 3 4) '(1 2 3 4))
(my-equal? '(1 2 3 4) '(1 2 3 5))