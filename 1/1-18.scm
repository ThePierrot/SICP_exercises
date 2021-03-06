#lang sicp

(define (time a b)
  (time-iter a b 0))

(define (time-iter a b c)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= b 1) (+ a c))
        ((is-odd b) (time-iter a (- b 1) (+ c a)))
        (else (time-iter (double a) (halve b) c))))

(define (is-odd n)
  (= (remainder n 2) 1))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(time 7 8) ;test