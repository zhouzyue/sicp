(define (e k)
  (+ 2 (cont-frac (lambda (i) 1.0)
             (lambda (i)
               (if (= (remainder i 3) 2)
                   (* (/ (+ i 1) 3) 2)
                   1))
             k)))
