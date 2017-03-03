(define (make-mobile left right) 
  (list left right)) 

(define (make-branch length structure) 
  (list length structure))

(define (left-branch mobile) 
  (car mobile)) 
(define (right-branch mobile) 
  (car (cdr mobile))) 
  
(define (branch-length branch) 
  (car branch))

(define (branch-structure branch) 
  (car (cdr branch))) 
  
(define (structure-is-mobile? structure) 
  (pair? structure))

(define (branch-weight branch) 
  (let ((s (branch-structure branch))) 
    (if (structure-is-mobile? s) 
        (total-weight s) 
        s))) 
  
(define (total-weight mobile) 
  (+ (branch-weight (left-branch mobile)) 
     (branch-weight (right-branch mobile))))

(define (balanced? mobile) (and (equal-torque? mobile)
                                (if (list? (branch-structure (left-branch mobile)))
                                    (balanced? (branch-structure (left-branch mobile)))
                                    #t)
                                (if (list? (branch-structure (right-branch mobile)))
                                    (branch-structure (cdr (right-branch mobile)))
                                    #t)))

(define (equal-torque? mobile)
  (= (* (branch-weight (left-branch mobile))
        (car (left-branch mobile)))
     (* (branch-weight (right-branch mobile))
        (car (right-branch mobile)))))

;tests
(define l1-mobile (make-mobile (make-branch 2 3) 
                               (make-branch 3 2))) 
(define l2-mobile (make-mobile (make-branch 3 l1-mobile) 
                               (make-branch 5 3))) 
(define l3-mobile (make-mobile (make-branch 4 l2-mobile) 
                               (make-branch 8 2))) 
  
(total-weight l1-mobile) 
(total-weight l2-mobile) 
(total-weight l3-mobile)

(balanced? l1-mobile)
(balanced? l2-mobile)
(balanced? l3-mobile)