(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set) (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define (intersection-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-list (cdr set1)
                                          (cdr set2))))
              ((< x1 x2)
               (intersection-list (cdr set1) set2))
              ((< x2 x1)
               (intersection-list set1 (cdr set2)))))))

(define (union-list set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((h1 (car set1))
                    (h2 (car set2))
                    (t1 (cdr set1))
                    (t2 (cdr set2)))
                (cond ((= h1 h2) (cons h1 (union-list t1 t2)))
                      ((< h1 h2) (cons h1 (union-list t1 set2)))
                      (else (cons h2 (union-list set1 t2))))))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result
               (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result
                   (partial-tree
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts
                     (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
      remaining-elts))))))))

(define (union-set set1 set2)
  (list->tree (union-list (tree->list-1 set1)
                          (tree->list-1 set2))))

(define (intersection-set set1 set2)
  (list->tree (intersection-list (tree->list-1 set1)
                          (tree->list-1 set2))))

; implementation
(define (lookup-set x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((< x (entry set))
         (lookup-set x (left-branch set)))
        (else (lookup-set x (right-branch set)))))

(define t1 (list->tree '(1 3 5 6 9 12 14 16 21 33 38 47)))

; test
(lookup-set 6 t1)
(lookup-set 9 t1)
(lookup-set 0 t1)
(lookup-set 1231 t1)