(define (same-parity a . list)
  (let ((parity (remainder a 2)))
    (cons a (same-parity-helper parity list))))

(define (same-parity-helper parity list)
    (if (null? list)
        '()
        (let ((a (car list))
              (b (cdr list)))
          (if (= (remainder a 2) parity)
            (cons a (same-parity-helper parity b))
            (same-parity-helper parity b)))))

;test
(same-parity 1 2 3 4 5 6 7)