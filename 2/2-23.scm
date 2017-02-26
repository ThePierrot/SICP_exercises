(define (my-for-each f items)
  (if (null? items)
      (newline)
      (f (car items)))
  (if (null? items)
      #t
      (my-for-each f (cdr items))))

; test
(my-for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))