(define (deep-reverse items) 
  (define (rev-iter items result) 
    (if (null? items) 
        result 
        (if (list? (car items))
            (rev-iter (cdr items)
                      (cons (deep-reverse (car items)) result))
            (rev-iter (cdr items)
                      (cons (car items) result)))))
  (rev-iter items '()))

; test
(deep-reverse (list(list 1 (list 2 3)) (list 4 5)))
