(define (has-cycle? x) 
  (define encountered '()) 
  (define (iter x) 
    (set! encountered (cons x encountered)) 
    (cond ((null? (cdr x)) #f) 
          ((memq (cdr x) encountered) #t) 
          (else (iter (cdr x))))) 
  (iter x)) 

; test
(define l1 '(a b c))
(set-cdr! (cddr l1) l1)
(has-cycle? l1)
(define l2 '(a b c))
(has-cycle? l2)