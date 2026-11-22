#lang racket/base
(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs)
            (my-append (cdr xs) ys))))