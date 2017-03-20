 (define (element-of-set? x set) 
   (cond ((null? set) #f) 
         ((equal? x (car set)) #t) 
         (else (element-of-set? x (cdr set))))) 

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
        (else (display "bad bit: CHOOSE-BRANCH"))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;; implementation
;; dsiplay is used in lieu of error since r5rs mode of racket does not
;; support error.
(define (encode-symbol symbol tree) 
  (if (not (element-of-set? symbol (symbols tree))) 
      (display "symbol cannot be encoded") 
      (if (leaf? tree) 
          '() 
          (let ((left-set (symbols (left-branch tree))) 
                (right-set (symbols (right-branch tree)))) 
            (cond ((element-of-set? symbol left-set) 
                   (cons 0 (encode-symbol symbol (left-branch tree)))) 
                  ((element-of-set? symbol right-set) 
                   (cons 1 (encode-symbol symbol (right-branch tree))))))))) 

; test
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))

(encode '(A A D A C A B B) sample-tree)

(element-of-set? 'A '(A B))