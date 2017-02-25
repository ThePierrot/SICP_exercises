(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (make-segment x y) (cons x y))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (mid-segment segment)
  (let ((x1 (x-point (start-segment segment)))
        (x2 (x-point (end-segment segment)))
        (y1 (y-point (start-segment segment)))
        (y2 (y-point (end-segment segment))))
    (make-point (/ (+ x1 x2) 2)
                 (/ (+ y1 y2) 2))))

(mid-segment (make-segment (make-point 1 2)
                           (make-point 3 4)))

