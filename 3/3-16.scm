; return 4
(define p1 (cons 'a 'b))
(define p2 (cons 'a 'b))
(define p3 (cons p1 p2))

; return 7
(define p4 (cons p1 p1))
(define p5 (cons p4 p4))

; infinite loop
(define p6 '(a b c))
(set-cdr! (cddr p6) p6)
