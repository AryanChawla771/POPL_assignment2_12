
;; S1: Binary Tree Traversals - Test Fragment

;; Test 1: Balanced seven-node tree
(define t1
  '(4 (2 (1 () ()) (3 () ()))
      (6 (5 () ()) (7 () ()))))

;; Test 2: Right-skewed tree
(define t2
  '(1 () (2 () (3 () ()))))

;; Test 3: Three-node symbol tree
(define t3
  '(a (b () ()) (c () ())))

;; Test 4: Empty tree
(define t4 '())

;; Test 5: Single-node tree
(define t5 '(9 () ()))


;; Test 1: Balanced tree
(print-inorder t1)
(print-all-traversals t1)
(print-height-and-leaves t1)

;; Test 2: Right-skewed tree
(print-inorder t2)
(print-all-traversals t2)
(print-height-and-leaves t2)

;; Test 3: Symbol tree
(print-inorder t3)
(print-all-traversals t3)
(print-height-and-leaves t3)

;; Test 4: Empty tree
(print-inorder t4)
(print-all-traversals t4)
(print-height-and-leaves t4)

;; Test 5: Single-node tree
(print-inorder t5)
(print-all-traversals t5)
(print-height-and-leaves t5)
