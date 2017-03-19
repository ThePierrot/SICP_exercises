(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else "bad bit: CHOOSE-BRANCH")))

; implementation
(define (encode-symbol smb tree) 
  (define (branch-correct? branch)
    (define (element-of-set? x set) 
      (cond ((null? set) false) 
            ((equal? x (car set)) true) 
            (else (element-of-set? x (cdr set))))) 
    (if (leaf? branch) 
        (equal? smb (symbol-leaf branch)) 
        (element-of-set? smb (symbols branch)))) 
  (let ((left (left-branch tree)) 
        (right (right-branch tree))) 
    (cond ((branch-correct? left) 
           (if (leaf? left) '(0) (cons 0 (encode-symbol smb left)))) 
          ((branch-correct? right) 
           (if (leaf? right) '(1) (cons 1 (encode-symbol smb right)))) 
          (else (error "symbol does not exist" bit)))))