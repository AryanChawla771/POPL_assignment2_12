# CS F301 — Principles of Programming Languages
## Assignment 2: Logic and Functional Programming

This repository contains **Group 12**'s solutions for CS F301 Assignment 2. It includes two SWI-Prolog problems (P1 and P2), two Scheme/Racket problems (S1 and S2), test files, development skill files, and AI prompt documentation.

### Group information

| Field | Value |
|---|---|
| Group ID | **12** |
| Group number from Assignment 1 | 68 |
| Academic year | 2026–2027 |
| Semester | 1 |
| Course | CS F301 : Principles of Programming Languages |

## Problems and solution files

| Problem | Language | Source file | Required functionality |
|---|---|---|---|
| P1 — Department Assignment Puzzle, Reloaded | Prolog | `code/12_q1.pl` | Find a solution, count solutions for selected clues, and add a ninth clue that makes the solution unique. |
| P2 — Form a Valid Arithmetic Equation | Prolog | `code/12_q2.pl` | Generate one valid equation, list all distinct valid equations in sorted order, and count them. |
| S1 — Binary Tree Traversals | Scheme/Racket | `code/12_q3.rkt` | Print inorder, preorder, and postorder traversals, plus tree height and leaf count. |
| S2 — Conditionally Insert into a Nested List | Scheme/Racket | `code/12_q4.rkt` | Recursively insert an atom into nested lists according to the original list length, using a higher-order inserter. |

## Repository layout

```text
POPL_assignment2_12/
├── code/
│   ├── 12_q1.pl
│   ├── 12_q2.pl
│   ├── 12_q3.rkt
│   └── 12_q4.rkt
├── tests/
│   ├── test_p1.pl
│   ├── test_p2.pl
│   ├── test_s1.rkt
│   └── test_s2.rkt
├── skills/
│   ├── prolog-dev/
│   │   └── SKILL.md
│   └── scheme-dev/
│       └── SKILL.md
├── prompts/
│   ├── P1.md
|   ├── P2.md
│   ├── S1.md
│   └── S2.md
|
├── P1_REPORT.md
|
└── README.md
```

## Environment

- **SWI-Prolog 9.x** for P1 and P2.
- **Racket 8.x** for S1 and S2; the Scheme solutions use `#lang racket/base` and only the constructs allowed by the assignment.
- Open a terminal in the **repository root** before running the commands below.

Check the installed versions:

```bash
swipl --version
racket --version
```

## Running the submitted solutions

### P1 — Department Assignment Puzzle

Print one solution to the original eight clues in the required four-line format:

```bash
swipl -q -f code/12_q1.pl -g main -t halt
```

Count the assignments satisfying **exactly** clues 1–8 (expected `3`):

```bash
swipl -q -f code/12_q1.pl -g "count_solutions([1,2,3,4,5,6,7,8],N),writeln(N)" -t halt
```

Count solutions satisfying clues 1–9 (expected `1`):

```bash
swipl -q -f code/12_q1.pl -g "count_solutions([1,2,3,4,5,6,7,8,9],N),writeln(N)" -t halt
```

The chosen ninth clue and the solution-count interpretation are documented in [`P1_REPORT.md`](P1_REPORT.md).

### P2 — Arithmetic Equation Generator

Generate one valid equation using the supplied numbers in their original order:

```bash
swipl -q -f code/12_q2.pl -g "generate_equation([4,2,5,3],E),writeln(E)" -t halt
```

List all valid equations (the assignment gives seven equations for this input):

```bash
swipl -q -f code/12_q2.pl -g "all_equations([4,2,5,3],Es),writeln(Es)" -t halt
```

Count the equations (expected `7`):

```bash
swipl -q -f code/12_q2.pl -g "count_equations([4,2,5,3],N),writeln(N)" -t halt
```

### S1 — Binary Tree Traversals

```bash
racket code/12_q3.rkt
```

### S2 — Conditional Nested List Insertion

```bash
racket code/12_q4.rkt
```

**Note about Scheme execution:** The submitted S1 and S2 files contain **definitions only**, so running either file directly should finish without printing anything. The assignment states that the grader appends its own function calls. For local demonstrations, use the temporary-file procedures below; do **not** add top-level calls to either submitted source file.

## Running the tests

### Prolog tests

Each Prolog test file loads its corresponding solution file:

```bash
swipl -q -s tests/test_p1.pl -g run_tests -t halt
swipl -q -s tests/test_p2.pl -g run_tests -t halt
```

- **P1:** Verifies the counts for clue subsets, the ninth clue's uniqueness, and the required solution shape.
- **P2:** Checks the published equations, sorted and duplicate-free results, generation and counting, and empty/singleton and no-solution cases.

### Scheme tests

The two Scheme test files are **test fragments**, not standalone `#lang racket/base` programs. Concatenate each fragment with its original solution in a temporary location, then run the resulting file:

```bash
cat code/12_q3.rkt tests/test_s1.rkt > /tmp/s1_final_test.rkt
racket /tmp/s1_final_test.rkt

cat code/12_q4.rkt tests/test_s2.rkt > /tmp/s2_final_test.rkt
racket /tmp/s2_final_test.rkt
```

- **S1:** Tests balanced, right-skewed, symbol-valued, empty, and single-node trees across the three public printing functions.
- **S2:** Tests the four assignment examples, outer and nested insertions, empty lists, `n = 0`, a custom predicate, and stress cases with 10,000 elements and 100 levels of nesting.

### Demonstrating S2's standard-input function

`print-insert-result` reads three values in order: `x`, `lst`, and `n`. To invoke it without changing the submitted solution:

```bash
cp code/12_q4.rkt /tmp/s2_demo.rkt
echo '(print-insert-result)' >> /tmp/s2_demo.rkt
printf '42\n((1 2) (3 4 5) (6) ())\n3\n' | racket /tmp/s2_demo.rkt
printf '7\n()\n0\n' | racket /tmp/s2_demo.rkt
```

Expected output:

```text
((42 1 2) (3 4 5) (42 6) (42))
```

The files under `/tmp/` are temporary **local test artifacts** and are not part of the submission.

## Development documentation

- [`skills/prolog-dev/SKILL.md`](skills/prolog-dev/SKILL.md) — Prolog development conventions, constraints, checks, and common failure modes.
- [`skills/scheme-dev/SKILL.md`](skills/scheme-dev/SKILL.md) — Scheme language restrictions, recursive design, checks, and common failure modes.
- `prompts/P1.md`, `prompts/P2.md`, `prompts/S1.md`, `prompts/S2.md` — AI prompt records for the corresponding problems. The assignment requires prompts **actually used** to be recorded word for word; any reconstructed examples must be clearly distinguished from historical prompts.
- [`P1_REPORT.md`](P1_REPORT.md) — Counts and interpretation of the original eight clues and the additional ninth clue.

