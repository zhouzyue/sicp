(define (equal?2 a b)
  (cond ((and (null? a) (null? b)) true)
        ((or (null? a) (null? b)) false)
        (else (or (and (symbol? a) (symbol? b) (eq? a b))
                  (and (equal? (car a) (car b))
                       (equal? (cdr a) (cdr b)))))))