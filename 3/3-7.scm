(define (make-account balance password) 
  (define (call-the-cops) "Call the cops") 
  (let ((count 0) 
        (limit 7)) 
    (define (withdraw amount) 
      (if (>= balance amount) 
          (begin (set! balance (- balance amount)) 
                 balance) 
          "Not enough money")) 
    (define (deposit amount) 
      (set! balance (+ balance amount)) 
      balance) 
    (define (dispatch pass m) 
      (if (not (eq? pass password)) 
          (lambda (amount) 
            (if (> count limit) 
                (call-the-cops) 
                (begin (set! count (+ count 1)) 
                       "Wrong password"))) 
          (begin (set! count 0) 
                 (cond ((eq? m 'withdraw) withdraw) 
                       ((eq? m 'deposit) deposit) 
                       (else (error "Unknown call -- MAKE-ACCOUNT" 
                                    m)))))) 
    dispatch))

(define (make-joint original-acc pw new-pw)
  (lambda (pw-input m)
    (if (eq? new-pw pw-input)
        (original-acc pw m)
        (lambda (x) "Wrong PW"))))

(define a1 (make-account 100 'abc123))
(define a2 (make-joint a1 'abc123 '123abc))

((a1 'abc123 'deposit) 10)
((a2 '123abc 'deposit) 10)