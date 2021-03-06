(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-set (cdr set1)
                                          (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin x set)
  (define (adjoin-iter x set1 set2)
    (cond ((null? set2)
           (append set1 (list x)))
          ((= x (car set2))
           (append set1 set2))
          ((< x (car set2))
           (append set1 (list x) set2))
          (else (adjoin-iter x
                             (append set1 (list (car set2)))
                             (cdr set2)))))
  (adjoin-iter x '() set))

; implementation
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((h1 (car set1))
                    (h2 (car set2))
                    (t1 (cdr set1))
                    (t2 (cdr set2)))
                (cond ((= h1 h2) (cons h1 (union-set t1 t2)))
                      ((< h1 h2) (cons h1 (union-set t1 set2)))
                      (else (cons h2 (union-set set1 t2))))))))

; tests
(union-set '(1 3 5 6 9 14 16) '(3 5 8 11 14 54 78))
(union-set '(1 2 3 4 5) '(4 5 6 7))
(union-set '(1 2) '(5 6 7))
(union-set '(1 2 3 4 5) '())
(union-set '() '(4 5 6 7))