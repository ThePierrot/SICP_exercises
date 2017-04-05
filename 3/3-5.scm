#lang racket
;; implmented by racket instead of Scheme
(define (square x) (* x x))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond [(= trials-remaining 0)
           (/ trials-passed trials)]
          [(experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1))]
          [else
           (iter (- trials-remaining 1)
                 trials-passed)]))
  (iter trials 0))

(define (rand-neg-1-to-1)
  (/ (- (random 1 1000001) 500001) 500000))

(define (in-unit-circle? x y)
    (<= (sqrt (+ (square x)
                 (square y)))
        1))

(define (pi-experiment)
  (in-unit-circle? (rand-neg-1-to-1)
              (rand-neg-1-to-1)))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define total-area
    (* (- x2 x1) (- y2 y1)))
  (* total-area (monte-carlo trials P)))

;; test
(display (estimate-integral
          pi-experiment -1 1 -1 1 100000))



