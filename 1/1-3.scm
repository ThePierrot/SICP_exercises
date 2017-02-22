#lang sicp

(define (sumSquare x y)
  (+ (* x x) (* y y)))
(define (Lsum x y z)
  (if (> x y)
      (if (> y z)
          (sumSquare x y)
          (sumSquare x z))
      (if (> x z)
          (sumSquare x y)
          (sumSquare y z))))

(Lsum 77 16 10)