(define (make-monitored f)
  (define counter 0)
  (lambda (x) (cond ((eq? x 'how-many-calls?)
                     counter)
                    ((eq? x 'reset-count)
                     (set! counter 0))
                    (else (begin (set! counter (+ counter 1))
                                 (f x))))))

;; tests
(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)
(s 81)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)