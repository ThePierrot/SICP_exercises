(define (make-interval a b)
  (cons a b))

(define (upper-bound n)
  (cdr n))

(define (lower-bound n)
  (car n))

(define (sub-interval x y)
(make-interval (- (lower-bound x) (upper-bound y))
               (- (upper-bound x) (lower-bound y))))

;test
(define a (make-interval 3 5))

(define b (make-interval 3 5))

(sub-interval a b)