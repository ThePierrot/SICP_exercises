#lang sicp

(define (qbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (qbrt-iter (improve guess x) x)))

(define (cube x) (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) #i0.00001))

(define (improve y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(qbrt-iter #i1 #i123)