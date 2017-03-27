;; put/get lib, using naive implementation
(define global-array '())

(define (make-entry k v) (list k v))

(define (key entry) (car entry))

(define (value entry) (cadr entry))

(define (put op type item)
  (define (put-helper k array)
    (cond ((null? array) (list(make-entry k item)))
          ((equal? (key (car array)) k) array)
          (else (cons (car array) (put-helper k (cdr array))))))
  (set! global-array (put-helper (list op type) global-array)))

(define (get op type)
  (define (get-helper k array)
    (cond ((null? array) #f)
          ((equal? (key (car array)) k) (value (car array)))
          (else (get-helper k (cdr array)))))
  (get-helper (list op type) global-array))

;; given procedures
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

;; predicate
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (product? x) (and (pair? x) (eq? (car x) '*)))

;; implmentation

(define (install-sum-package)
  (define (make-sum a1 a2)
    (cons a1 a2))
  (define (addend s) (cadr s))
  (define (augend s) (caddr s))
  (define (deriv-sum s)
    (make-sum (deriv (addend s)) (deriv aggend s)))
  (define (tag x) (attach-tag '+ x))
  (put 'deriv '(+) deriv-sum)
  (put 'make-sum 'x
       (lambda (x y) (tag (make-sum x y))))
  'done)

(define (install-product-package) 
  (define (make-product m1 m2) (cons m1 m2)) 
  (define (multiplier p) (cadr p)) 
  (define (multiplicand p) (caddr p)) 
  (define (deriv-product p) 
    (make-sum 
     (make-product (multiplier exp) 
                   (deriv (multiplicand exp) var)) 
     (make-product (deriv (multiplier exp) var) 
                   (multiplicand exp))))   
  (define (tag x) (attach-tag '* x)) 
  (put 'deriv '(*) deriv-product) 
  (put 'make-product '* 
       (lambda (x y) (tag (make-product x y)))) 
  'done)

(install-sum-package)
(install-product-package)