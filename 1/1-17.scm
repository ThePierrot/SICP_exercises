#lang sicp

(define (time a b)
  (cond ((= b 0) 0)
        ((is-odd b) (+ a (time a (- b 1))))
        (else (time (double a) (halve b)))))

(define (is-odd n)
  (= (remainder n 2) 1))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(time 7 8) ;testw