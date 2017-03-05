(define (tree-map tree f)
  (cond ((null? tree) '())
        ((not (pair? tree)) (f tree))
        (else (cons (tree-map (car tree) f)
                    (tree-map (cdr tree) f)))))

; test
(define a (list (list 1 2)
                (list (list 3 4) 5)
                (list 6 7)))

(tree-map a (lambda (x) (+ x 1)))

