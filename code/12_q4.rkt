#lang racket/base
(define (my-length lst)
  (let loop ((remaining lst)
             (count 0))
    (if (null? remaining)
        count
        (loop (cdr remaining) (+ count 1)))))

(define (my-map f lst)
  (let collect ((remaining lst)
                (acc '()))
    (if (null? remaining)
        (let restore ((remaining acc)
                      (result '()))
          (if (null? remaining)
              result
              (restore (cdr remaining)
                       (cons (car remaining) result))))
        (collect (cdr remaining)
                 (cons (f (car remaining)) acc)))))