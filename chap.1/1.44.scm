(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) 
                    (f x) 
                    (f (+ x dx))) 
                 3)))

(define (smooth-n f n)
  (repeat smooth n) f)
