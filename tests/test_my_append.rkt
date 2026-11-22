#lang racket/base

(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs)
            (my-append (cdr xs) ys))))

(display (my-append '(1 2) '(3 4)))
(newline)

(display (my-append '() '(3 4)))
(newline)

(display (my-append '(1 2) '()))
(newline)