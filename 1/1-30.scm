(define (sum-iter term a next b sum)
  (if (> a b)
      sum
      (sum-iter term (next a) next b (+ sum
                                        (term a)))))

(define (inc n) (+ n 1))

(define (cube n)
  (* n n n))

(sum-iter cube 1 inc 10 0)