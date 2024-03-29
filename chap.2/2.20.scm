(define (same-parity x . y)
  (define (same a)
    (= (remainder x 2) (remainder a 2)))
  (define (iter l)
    (cond ((null? l) (list))
          ((same (car l)) (cons (car l) (iter (cdr l))))
          (else (iter (cdr l)))))
  (iter (cons x y)))


(define (same-parity2 x . y)
  (define (same a)
    (= (remainder x 2) (remainder a 2)))
  (define (iter l result)
    (if (null? l) 
        result
        (iter (cdr l) (if (same (car l))
                          (cons (car l) result)
                          result))))
  (reverse (iter y (list x))))
