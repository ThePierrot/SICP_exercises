(define (make-rat n d neg?)
  (let ((g (gcd n d)))
    (if (= neg? 0)
        (cons (/ n g) (/ d g))
        (cons (/ (- 0 n) g) (/ d g)))))

(make-rat 1 2 1)

