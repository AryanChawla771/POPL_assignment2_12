#lang racket/base

(define-namespace-anchor anchor)
(define ns (namespace-anchor->namespace anchor))

(parameterize ([current-namespace ns])
  (load "code/12_q3.rkt"))

(define t1
  '(4 (2 (1 () ()) (3 () ()))
      (6 (5 () ()) (7 () ()))))

(display
 (parameterize ([current-namespace ns])
   (eval '(my-inorder
           '(4 (2 (1 () ()) (3 () ()))
               (6 (5 () ()) (7 () ())))))))
(newline)