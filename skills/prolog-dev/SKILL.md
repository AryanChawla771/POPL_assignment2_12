---
name: prolog-dev
description: Development guidelines for SWI-Prolog solutions used in CS F301 Principles of Programming Languages Assignment 2.
---

# Prolog Development Skill

## Language

- SWI-Prolog 9.x
- Pure declarative programming
- No global variables
- No dynamic predicates
- No assert/retract

---

# Coding Style

## Predicate Naming

- Use lowercase_with_underscores.
- Predicate names should describe behaviour.
- Example:

count_solutions/2
generate_equation/2

---

## Variables

Use meaningful variable names.

Good

Solution
Person
Department
Language
Project

Avoid

X
Y
Tmp
Data1

---

## Comments

Comment every major predicate.

Example

% succeeds when Solution satisfies clue 3
clue(3, Solution).

For helper predicates

% true if all departments are unique

---

## Declarative Style

Write predicates that describe facts instead of procedures whenever possible.

Prefer

member(...)
select(...)
permutation(...)
maplist(...)

instead of procedural thinking.

---

# Allowed Libraries

Only use

- lists
- apply
- yall
- aggregate

Do not import any other libraries.

---

# Constraints

Never use

assert/1
retract/1
asserta/1
assertz/1
nb_setval
b_setval
global variables

Never hardcode answers.

Solutions must be derived from constraints.

---

# Problem-specific Guidelines

## Puzzle Problem

- Each clue must be its own predicate.
- Do not combine clues.
- Keep constraints independent.

Example

clue(1, Solution).

clue(2, Solution).

---

## Equation Problem

Represent expressions as expression trees.

Never evaluate expressions by constructing strings.

Division is only valid when

- divisor ≠ 0
- dividend divisible by divisor

---

# Testing

Run

swipl -q -f id_q1.pl -g main -t halt

Run any predicate

swipl -q -f id_q1.pl -g "goal" -t halt

Example

swipl -q -f id_q1.pl -g "count_solutions([1,2,3],N)" -t halt

---

# Self Review Checklist

Before returning code verify:

[ ] Predicate names are descriptive

[ ] No forbidden libraries

[ ] No assert/retract

[ ] No global state

[ ] No infinite recursion

[ ] All predicates terminate

[ ] No duplicate solutions

[ ] All helper predicates documented

[ ] Code is deterministic where expected

[ ] Hidden edge cases considered

---

# Common AI Failure Modes

- Mixing procedural and declarative logic
- Forgetting backtracking behaviour
- Using cuts (!) unnecessarily
- Accidentally producing duplicate answers
- Hardcoding puzzle solutions
- Infinite recursion
- Incorrect operator precedence
- Division by zero
- Non-integer division
- Missing base cases
- Incorrect variable scoping
- Printing output when predicate should only unify
