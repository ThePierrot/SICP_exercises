; lib
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (x) (car x))
                                     seqs))
            (accumulate-n op init (map
                                   (lambda (x) (cdr x))
                                   seqs)))))

; definition of dot product
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; definition of matrix times vector
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

; definition of transpose
(define (transpose mat)
  (accumulate-n cons '() mat))

; definition of matrix-*-matrix
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

; tests
(define m1 (list (list 1 2 3)
                 (list 4 5 6)
                 (list 7 8 9)))

(define m2 (list (list 1 0 0)
                 (list 0 1 0)
                 (list 0 0 2)))

(define v1 (list 1 2 3))

(matrix-*-vector m1 v1)
(transpose m1)
(matrix-*-matrix m1 m2)