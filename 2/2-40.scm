; lib
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval a b)
  (if (<= a b)
      (cons a (enumerate-interval (+ a 1) b))
      '()))

; implementation
(define (unique-pair n)
  (accumulate append '()
              (map (lambda (i)
                     (map (lambda (j)
                            (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

; test
(unique-pair 100)