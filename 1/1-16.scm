#lang sicp

(define (fast-expt b n)
  (fast-expt-iter b n b))

(define (fast-expt-iter b n a)
  (cond ((= n 1) a)
        ((is-odd n) (fast-expt-iter b (- n 1) (* a b)))
        (else (fast-expt-iter b (/ n 2) (* a a)))))

(define (is-odd n)
  (= (remainder n 2) 1))

(fast-expt 3 4) ;test