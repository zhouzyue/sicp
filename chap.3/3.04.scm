(define (make-account balance password)
  (define (call-the-cops) "call the cops")
  (let ((wrong-times 0))
    (define (clear)
      (set! wrong-times 0))
    (define (withdraw amount)
      (clear)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficieant funds"))
    (define (deposit amount)
      (clear)
      (set! balance (+ balance amount))
      balance)
    (define (wrong-password amount)
      (begin (set! wrong-times (+ wrong-times 1))
             (if (>= wrong-times 7)
                 (call-the-cops)
                 "Incorrect password")))
    (define (dispatch pass m)
      (cond ((not (eq? pass password)) wrong-password)
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unkown request -- MAKE-ACCOUNT"
                         m))))
    dispatch))
