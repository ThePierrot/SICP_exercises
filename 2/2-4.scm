(define (my-cons a b) 
  (lambda (m) (m a b)))

(define (my-car z) 
  (z (lambda (p q) p)))

(define (my-cdr z) 
  (z (lambda (p q) q)))

;test
(define a (my-cons 1 2))

(my-cdr a)
