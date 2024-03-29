(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (range 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

; (define (safe? col positions)
;   (define same (lambda (x) (= (car positions) x)))
;   (define (diagonals k items)
;     (if (= k col)
;         (list)
;         (append (list (+ (car items) k) (- (car items) k))
;                 (diagonals (+ k 1) (cdr items)))))
;   (and (null? (filter same (cdr positions)))
;        (null? (filter same (diagonals 1 (cdr positions))))))

(define (safe? col positions)
  (let ((new-queen (car positions)))
    (define (iter items up-diagonal down-diagonal)
        (cond ((null? items) true)
              ((or (= (car items) new-queen)
                   (= (car items) up-diagonal)
                   (= (car items) down-diagonal)) 
               false)
              (else (iter (cdr items) (+ up-diagonal 1) (- down-diagonal 1)))))
    (iter (cdr positions) (+ new-queen 1) (- new-queen 1))))

(define (adjoin-position new-row col rest-of-queens)
  (cons new-row rest-of-queens))

(define empty-board
  (list))
