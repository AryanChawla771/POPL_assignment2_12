
;; S2 test fragment -- append to a TEMPORARY copy of code/12_q4.rkt.
;; Do not include this fragment in the submitted solution file.

;; Four assignment examples, in specification order.
(display (insert-if-short 42 '((1 2) (3 4 5) (6) ()) 3))
(newline)
(display (insert-if-short 0 '(((1) 2) (3) ((4 5 6) ())) 3))
(newline)
(display (insert-if-short 7 '() 3))
(newline)
(display (insert-if-short 7 '() 0))
(newline)

;; Outermost insertion.
(display (insert-if-short 8 '(a b) 3))
(newline)

;; Nested empty lists: the outer list has exactly two elements.
(display (insert-if-short 5 '(() (())) 2))
(newline)

;; n = 0: no insertion at any nesting level.
(display (insert-if-short 9 '((1) () 2) 0))
(newline)

;; Outer length = n (no outer insertion); inner length < n.
(display (insert-if-short 9 '(1 2 (3 4)) 3))
(newline)

;; Symbol atoms stay unchanged except for specified insertions.
(display (insert-if-short 'x '(a (b c) () d) 3))
(newline)

;; Custom length predicate: insert only into lists of length exactly 2.
(display ((make-inserter 'z (lambda (size) (= size 2)))
          '((a b) (c d))))
(newline)

;; Direct helper checks: empty and nested inputs; my-map preserves order.
(display (list (my-length '())
               (my-length '(a (b c) ()))
               (my-map (lambda (item) (list 'seen item)) '())
               (my-map (lambda (item) (list 'seen item))
                       '(a (b c) ()))))
(newline)

;; Stress: 10,000 top-level elements, constructed using permitted forms.
(define s2-large-input
  (let build-large ((remaining 10000) (acc '()))
    (if (= remaining 0)
        acc
        (build-large (- remaining 1)
                     (cons remaining acc)))))

(define s2-large-output
  (insert-if-short 'z s2-large-input 10001))

(display
 (list (my-length s2-large-input)
       (my-length s2-large-output)
       (car s2-large-output)
       (car (cdr s2-large-output))
       (let find-last ((remaining s2-large-output))
         (if (null? (cdr remaining))
             (car remaining)
             (find-last (cdr remaining))))))
(newline)

;; Stress: 100 levels of nested single-element lists around an empty list.
(define s2-deep-input
  (let nest-deep ((depth 100) (current '()))
    (if (= depth 0)
        current
        (nest-deep (- depth 1) (list current)))))

(define s2-deep-output
  (insert-if-short 'z s2-deep-input 2))

;; True iff all 100 outer lists and the innermost empty list receive z.
(display
 (let check-deep ((current s2-deep-output) (levels 100))
   (if (= levels 0)
       (and (= (my-length current) 1)
            (eq? (car current) 'z))
       (and (= (my-length current) 2)
            (eq? (car current) 'z)
            (pair? (car (cdr current)))
            (check-deep (car (cdr current)) (- levels 1))))))
(newline)
