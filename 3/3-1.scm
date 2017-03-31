(define (make-accumulator num)
  (define (add m)
    (cond ((number? m)
           (begin (set! num (+ num m))
                  num))
          (else "ERROR: not a number")))
  add)

;; test
(define a1 (make-accumulator 5))
(a1 10)
(a1 10)