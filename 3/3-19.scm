(define (has-cycle? li)
  (define (iter p1 p2)
    (if (eq? p1 p2)
        #t
        (if (and (pair? p1) (pair? p2))
            (if (pair? (cdr p2))
                (iter (cdr p1) (cddr p2))
                #f)
            #f)))
  (iter li (cdr li)))

; test
(define l1 '(a b c))
(set-cdr! (cddr l1) l1)
(has-cycle? l1)
(define l2 '(a b c))
(has-cycle? l2)