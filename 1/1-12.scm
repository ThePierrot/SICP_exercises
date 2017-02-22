#lang sicp

(define (pascal row number)
  (if (or (= number 1) (= number row)) 1
      (+ (pascal (- row 1) (- number 1))
         (pascal (- row 1) number))))

(pascal 100 5) ;test