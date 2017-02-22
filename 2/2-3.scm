;Implement trangle instead of rectangle.

;basic function
(define (square x) (* x x))

;point APIs
(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (equal-point point1 point2)
  (and (= (cdr point1) (cdr point2))
       (= (car point1) (car point2))))

(define (make-segment x y) (cons x y))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (length-segment segment)
  (sqrt (+ (square (- (x-point (start-segment segment))
                      (x-point (end-segment segment))))
           (square (- (y-point (start-segment segment))
                      (y-point (end-segment segment)))))))

(define (mid-segment segment)
  (let ((x1 (x-point (start-segment segment)))
        (x2 (x-point (end-segment segment)))
        (y1 (y-point (start-segment segment)))
        (y2 (y-point (end-segment segment))))
    (make-point (/ (+ x1 x2) 2)
                 (/ (+ y1 y2) 2))))


;trangle APIs
(define (make-tran seg1 seg2)
  (if (not (equal-point (start-segment seg1)
                          (start-segment seg2)))
      (-1)
      (cons seg1 seg2)))

(define (seg1-tran tran)
  (car tran))

(define (seg2-tran tran)
  (cdr tran))

(define (base-tran tran)
  (make-segment (end-segment (seg1-tran tran))
                (end-segment (seg2-tran tran))))

(define (perimeter-tran tran)
  (+ (length-segment (seg1-tran tran))
     (length-segment (seg2-tran tran))
     (length-segment (base-tran tran))))

(define (area-tran tran) (let ((a (length-segment (seg1-tran tran)))
                               (b (length-segment (seg2-tran tran)))
                               (c (length-segment (base-tran tran)))
                               (s (/ (perimeter-tran tran) 2)))
                           (sqrt (* s
                              (- s a)
                              (- s b)
                              (- s c)))))

;define a new trangle
(define tran1 (make-tran (make-segment (make-point 0 0)
                           (make-point 3 0))
                         (make-segment (make-point 0 0)
                           (make-point 0 4))))

;tests
(perimeter-tran tran1)

(area-tran tran1)