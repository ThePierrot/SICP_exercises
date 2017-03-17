(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (union-set set1 set2)
  (accumulate adjoin-set set1 set2))

; tests
(element-of-set? 1 '(1 2 3))
(adjoin-set 1 '(2 3 4))
(union-set'(1 3 5 6 9 14 16) '(3 5 8 11 14 54 78))
(intersection-set '(1 1 2 2 3 3) '(2 3 4 4 5 6))