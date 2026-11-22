#lang racket/base
(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs)
            (my-append (cdr xs) ys))))
(define (my-inorder tree)
  (if (null? tree)
      '()
      (my-append
        (my-inorder (car (cdr tree)))
        (cons (car tree)
              (my-inorder (car (cdr (cdr tree))))))))
(define (my-preorder tree)
  (if (null? tree)
      '()
      (cons (car tree)
            (my-append
              (my-preorder (car (cdr tree)))
              (my-preorder (car (cdr (cdr tree))))))))