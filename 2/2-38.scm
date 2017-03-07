(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

; deferent
(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list '() (list 1 2 3))
(fold-left list '() (list 1 2 3))
; same
(fold-right + 0 (list 1 2 3))
(fold-left + 0 (list 1 2 3))
(fold-right * 1 (list 1 2 3))
(fold-left * 1 (list 1 2 3))

;; The result of fold-right and fold-left will be
;; the same if the operation follows the communi-
;; cative law. In other words, the order of oper-
;; ation does not affect the result.