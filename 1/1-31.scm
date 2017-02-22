(define (product-iter term inc a b prdkt)
  (if (> a b)
      prdkt
      (product-iter term inc (inc a) b (* prdkt (term a)))))

(define (product n) (product-iter (lambda (a) a)
              (lambda (a) (+ a 1))
              1 n 1))

(define (is-even n)
  (if (= (remainder n 2) 0) #t #f))

(define (pi-term n)
  (if (is-even n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))

(define (pi n)
  (* #i4 (product-iter pi-term (lambda (n) (+ n #i1)) #i1 n #i1)))

(product 5) ;product

(pi #i100000000) ;pi