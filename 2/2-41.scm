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

(define (filter f items)
  (if (null? items)
      '()
      (let ((x (car items))
            (xs (cdr items)))
        (if (f x)
            (cons x (filter f xs))
            (filter f xs)))))

; generate triples
(define (pair-gen-tri n)
  (accumulate append '()
              (accumulate append '()
                          (map (lambda (i)
                                 (map (lambda (j)
                                        (map (lambda (k) (list i j k))
                                             (enumerate-interval 1 n)))
                                      (enumerate-interval 1 n)))
                               (enumerate-interval 1 n)))))

; find unique pairs
(define (unique-pairs s)
  (filter (lambda (x)
            (= (accumulate + 0 x) s))
          (pair-gen-tri (- s 2))))

; test
(unique-pairs 10)