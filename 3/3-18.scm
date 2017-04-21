(define (has-circle? list)
  (define original list)
  (define (helper list)
    (if (pair? list)
        (if (eq? original (cdr list))
            #t
            (helper (cdr list)))
        #f))
  (helper list))

; test
(define l1 '(a b c))
(set-cdr! (cddr l1) l1)
(has-circle? l1)
(define l2 '(a b c))
(has-circle? l2)