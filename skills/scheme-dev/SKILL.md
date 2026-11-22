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

Avoid side effects except the required display and newline
operations, and read for input in S2.

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
---

# Exact Allowed Built-ins

Use only the following built-ins, as specified in the assignment:

- Definitions and binding: define, lambda, let, let*, letrec, named let
- Control flow: if, cond (with else), and, or, not, begin
- Lists and symbols: quote ('), cons, car, cdr, list, and compositions of car and cdr up to four levels
- Predicates and lookup: null?, pair?, eq?, assq, assoc
- Arithmetic and comparison: +, -, *, <, >, <=, >=, =, max
- Output: display, newline
- Input: read (S2 only)

Do not use any other racket/base built-ins.

# AI Prompt Decomposition Rule

Each prompt must request exactly one unit of work:
- One function
- One test file
- One code review

Never generate the complete solution to an entire assignment problem in a single response.

When implementing one function, assume existing helpers are available when specified. Do not implement unrelated functions.

# S2 Additional Correctness Requirements

- Measure every list's original top-level length before insertion.
- Process the outermost list and every nested list.
- Empty lists have length zero.
- Atoms must remain unchanged.
- Use my-length and my-map as required.
- make-inserter must return a function that performs recursive insertion.
- The final insert-if-short must use make-inserter.
- The final file must contain only one definition of insert-if-short.
- Test lists containing 10,000 elements and nesting depth 100.
- Review stack usage, termination, and unnecessary repeated traversal.

# Submission and Verification Rules

- Submitted files must contain definitions only.
- No top-level test calls or printed output.
- Tests must be kept in separate files.
- Do not claim tests passed without actual execution.
- Check all output against the assignment's exact examples.
- Ensure every printed output line ends with a newline.
- Log every LLM prompt exactly as submitted, including debugging and review prompts.
- Keep incremental Git commits reflecting individual functions, tests, and reviews.
