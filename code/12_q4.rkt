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

(define (make-inserter x len-ok?)
  (letrec ((process-list
            (lambda (lst)
              (let* ((original-length (my-length lst))
                     (processed
                      (my-map
                       (lambda (item)
                         (if (or (pair? item) (null? item))
                             (process-list item)
                             item))
                       lst)))
                (if (len-ok? original-length)
                    (cons x processed)
                    processed)))))
    process-list))

(define (insert-if-short x lst n)
  ((make-inserter x
                  (lambda (len) (< len n)))
   lst))

(define (print-insert-result)
  (let* ((x (read))
         (lst (read))
         (n (read)))
    (display (insert-if-short x lst n))
    (newline)))