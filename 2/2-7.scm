(define (make-interval a b)
  (cons a b))

(define (upper-bound n)
  (cdr n))

(define (lower-bound n)
  (car n))

;tests
(define a (make-interval 1 2))

(lower-bound a)

(upper-bound a)