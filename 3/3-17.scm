(define (count-pairs x) 
  (let ((counted '())) 
    (define (uncounted? x) 
      (if (memq x counted) 
          0 
          (begin 
            (set! counted (cons x counted)) 
            1))) 
    (define (count x) W
      (if (not (pair? x)) 
          0 
          (+ (count (car x)) 
             (count (cdr x)) 
             (uncounted? x)))) 
    (count x))) 

(define third (cons 'a 'b)) 
(define second (cons third third)) 
(define first (cons second second)) 

(count-pairs firstWW)