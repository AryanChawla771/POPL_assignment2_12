---
name: scheme-dev
description: Development guidelines for Racket/Scheme solutions used in CS F301 Principles of Programming Languages Assignment 2.
---

# Scheme Development Skill

## Language

- Racket 8.x
- #lang racket/base

Only use built-ins permitted in the assignment.

---

# Coding Style

## Function Naming

Use lowercase-with-hyphens.

Examples

print-inorder
print-all-traversals
insert-if-short

Avoid

foo
func1
temp

---

## Functional Style

Write pure recursive functions.

Never mutate data.

Never use side effects except display and newline where required.

---

## Recursion

Always define

- clear base case
- recursive case

Prefer tail recursion where natural.

---

# Forbidden Features

Never use

set!
vector
hash
strings
for
do
while

Never use

length
append
reverse
map
filter
member
memq
list-ref
list-tail

If needed

implement your own helper function.

---

# Data Structures

Binary tree

()

or

(value left right)

Nested list

(atom ...)
(list ...)
(any combination)

---

# Printing Rules

Only print exactly what the assignment requests.

No prompts.

No debugging output.

Always end output using newline.

---

# Testing

Run

racket id_q3.rkt

or

racket id_q4.rkt

The grader will call functions automatically.

Never execute functions at file load.

---

# Problem-specific Guidelines

## Tree Traversals

Implement

- inorder
- preorder
- postorder

Use recursive traversal.

Height

height(empty)=0

Leaf count

Leaf = both children empty.

---

## Nested List Problem

Write

my-length

my-map

before implementing

insert-if-short

Finally rewrite insert-if-short using

make-inserter

---

# Self Review Checklist

Before returning code verify

[ ] Only allowed built-ins used

[ ] No mutation

[ ] No forbidden library calls

[ ] Recursive base cases exist

[ ] Empty list handled correctly

[ ] Deep nesting supported

[ ] Output format matches specification

[ ] Every printed line ends with newline

[ ] No extra output

---

# Common AI Failure Modes

- Accidentally using forbidden built-ins
- Forgetting empty-list base case
- Printing extra spaces
- Infinite recursion
- Incorrect traversal order
- Treating nested lists incorrectly
- Using mutation
- Confusing atoms with lists
- Missing newline
- Failing on deeply nested inputs
