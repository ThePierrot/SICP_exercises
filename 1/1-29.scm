(define (simpson-helper f a b n k sum)
  (let ((h (/ (- b a) n)))
    (cond ((= k 0)
           ((simpson-helper f a b n
                            (+ k 1)
                            (+ (f (+ a(* k h))) sum))))
          ((= k n)
           (+ sum (f (+ a (* k h)))))
          ((= (remainder k 2) 1)
           (simpson-helper f a b n
                           (+ k 1)
                           (+ (* 4 (f (+ a(* k h)))) sum)))
          ((= (remainder k 2) 0)
           (simpson-helper f a b n
                           (+ k 1)
                           (+ (* 2 (f (+ a (* k h)))) sum))))))

(define (simpson f a b n) (* (/ (- b a) (* 3 n))
                             (simpson-helper f a b n 1 0)))

(simpson (lambda (x) (* x x x)) 0 4 1000)