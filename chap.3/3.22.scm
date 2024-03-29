(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (insert-queue item)
      (let ((new-pair (cons item '())))
        (cond ((null? front-ptr)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair)
               (print-queue))
              (else
                (set-cdr! rear-ptr new-pair)
                (set! rear-ptr (cdr rear-ptr))
                (print-queue)))))
    (define (delete-queue)
      (cond ((null? front-ptr)
             (error "DELETE! called with an empty queue" front-ptr))
            (else
              (set! front-ptr (cdr front-ptr))
              (print-queue))))
    (define (print-queue)
      (define (iter q)
        (cond ((null? q) 
               (display "()") 
               (newline))
              (else
                (display (car q))
                (display "->")
                (iter (cdr q)))))
      (if (null? front-ptr)
          (newline)
          (iter front-ptr)))
    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) (null? front-ptr))
            ((eq? m 'front-ptr) front-ptr)
            ((eq? m 'rear-ptr) rear-ptr)
            ((eq? m 'insert-queue!) insert-queue)
            ((eq? m 'delete-queue!) (delete-queue))
            ((eq? m 'print-queue) (print-queue))))
    dispatch))

(define (empty-queue? queue) (queue 'empty-queue?))
(define (front-ptr queue) (queue 'front-ptr))
(define (rear-ptr queue) (queue 'front-ptr))
(define (insert-queue! queue item) ((queue 'insert-queue!) item))
(define (delete-queue! queue) (queue 'delete-queue!))
(define (print-queue queue) (queue 'print-queue))
