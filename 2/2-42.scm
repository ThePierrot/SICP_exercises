; lib
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (filter f items)
  (if (null? items)
      '()
      (let ((x (car items))
            (xs (cdr items)))
        (if (f x)
            (cons x (filter f xs))
            (filter f xs)))))

(define (enumerate-interval a b)
  (if (<= a b)
      (cons a (enumerate-interval (+ a 1) b))
      '()))

; main procedure, given by the problem
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; implementations
(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
         (cons (cons new-row k) rest-of-queens))

(define (safe? k positions)
  (define (safe?-iter row col k positions)
    (if (= k 0)
        #t
        (let ((current-row (car (car positions)))
              (current-col (cdr (car positions))))
          (if (or (= (abs (- row current-row))
                     (abs (- col current-col)))
                  (= row (car (car positions)))
                  (= col (cdr (car positions))))
              #f
              (and (safe?-iter row col (- k 1) (cdr positions))
                   #t)))))
  (safe?-iter (car (car positions))
              (cdr (car positions))
              (- k 1)
              (cdr positions)))

; test
(queens 8)