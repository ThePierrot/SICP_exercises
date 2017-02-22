#lang sicp

(define (f-re n)
  (if (< n 3)
      n
      (+ (f-re (- n 1))
         (* 2 (f-re (- n 2)))
         (* 3 (f-re (- n 3))))))

(define (f-it n)
  (f-iter n 2 1 0 2))

(define (f-iter n a b c counter)
  (if (= n counter)
      a
      (f-iter n
              (+ a (* 2 b) (* 3 c))
              a
              b
              (+ counter 1))))

(f-it 10) ;test f-it
(f-re 10) ;test f-re

