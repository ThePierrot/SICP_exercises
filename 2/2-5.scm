(define (make-int-pair a b)
  (* (expt 2 a) (expt 3 b)))

(define (car-int a)
  (define (car-int-iter a counter)
    (if (= (remainder a 2) 0)
        (car-int-iter (/ a 2) (+ counter 1))
        counter))
  (car-int-iter a 0))

(define (cdr-int a)
  (define (cdr-int-iter a counter)
    (if (= (remainder a 3) 0)
        (cdr-int-iter (/ a 3) (+ counter 1))
        counter))
  (cdr-int-iter a 0))

;tests
(define a (make-int-pair 11 5))

(car-int a)

(cdr-int a)