(define (fringe items)
  (define (fringe-iter items result)
    (if (null? items)
        result
        (let ((x (car items))
              (xs (cdr items)))
          (if (list? x)
              (fringe-iter xs (append result
                                      (fringe-iter x '())))
              (fringe-iter xs (append result (list x)))))))
  (fringe-iter items '()))

;tests
(fringe '())
(fringe (list 1 2))
(fringe (list (list 1 (list 2 3)) (list (list (list 4 5) 7) 8)))