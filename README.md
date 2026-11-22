# CS F301 — Principles of Programming Languages
## Assignment 2: Logic and Functional Programming

This repository contains Group 12's solutions to CS F301 Assignment 2, covering logic programming in SWI-Prolog and functional programming in Scheme/Racket. It includes the four solutions, tests, AI development skill files, and prompt documentation.

## Group information

| Field | Value |
|---|---|
| Group ID | **12** |
| Group number (Assignment 1) | 68 |
| Academic year | 2026–2027 |
| Semester | 1 |
| Course | CS F301 — Principles of Programming Languages |

## Problems

| Problem | Language | Source | Purpose |
|---|---|---|---|
| P1 — Department Assignment Puzzle, Reloaded | Prolog | `code/12_q1.pl` | Solve the attribute puzzle, count solutions for selected clues, and add a uniqueness clue. |
| P2 — Form a Valid Arithmetic Equation | Prolog | `code/12_q2.pl` | Generate, enumerate, and count valid equations built from ordered numbers. |
| S1 — Binary Tree Traversals | Scheme/Racket | `code/12_q3.rkt` | Print inorder, preorder and postorder traversals, tree height, and leaf count. |
| S2 — Conditionally Insert into a Nested List | Scheme/Racket | `code/12_q4.rkt` | Recursively insert an atom into lists that meet a length condition, using higher-order functions. |

## Repository structure

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
│   ├── p1.md
│   ├── s1.md
│   └── s2.md
│
└── README.md
```

`P1_REPORT.md` records the number of solutions satisfying clues 1–8 and explains the effect of the ninth clue. The `prompts/` directory is for documenting AI interactions for each problem, including the actual prompts used, as required by the assignment.

## Required environment

- **SWI-Prolog 9.x** for P1 and P2.
- **Racket 8.x** for S1 and S2, using `#lang racket/base` and only the built-ins permitted by the assignment.
- Run the following commands from the **repository root**.

Check installations with:

```bash
swipl --version
racket --version
```

## Running the solutions

### P1 — Department Assignment Puzzle

Print one solution to the original eight clues in the specified four-line format:

```bash
swipl -q -f code/12_q1.pl -g main -t halt
```

Count solutions under clues 1–8 (expected: `3`):

```bash
swipl -q -f code/12_q1.pl -g "count_solutions([1,2,3,4,5,6,7,8],N),writeln(N)" -t halt
```

Count solutions under clues 1–9 (expected: `1`):

```bash
swipl -q -f code/12_q1.pl -g "count_solutions([1,2,3,4,5,6,7,8,9],N),writeln(N)" -t halt
```

### P2 — Arithmetic Equation Generator

Generate one valid equation:

```bash
swipl -q -f code/12_q2.pl -g "generate_equation([4,2,5,3],E),writeln(E)" -t halt
```

List all valid equations for the example input:

```bash
swipl -q -f code/12_q2.pl -g "all_equations([4,2,5,3],Es),writeln(Es)" -t halt
```

Count equations (expected: `7`):

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

**Important:** Both submitted Scheme files contain definitions only. Running either directly should produce **no output**. As stated in the assignment, the grader appends its own calls to the source files.

## Running the tests

### Prolog tests

Each test file loads the corresponding Prolog solution and executes its checks:

```bash
swipl -q -s tests/test_p1.pl -g run_tests -t halt
swipl -q -s tests/test_p2.pl -g run_tests -t halt
```

### Scheme tests

The Scheme tests are **fragments**, not standalone Racket modules. Append each fragment to a **temporary copy** of its source file before executing it:

```bash
cat code/12_q3.rkt tests/test_s1.rkt > /tmp/s1_final_test.rkt
racket /tmp/s1_final_test.rkt

cat code/12_q4.rkt tests/test_s2.rkt > /tmp/s2_final_test.rkt
racket /tmp/s2_final_test.rkt
```

The S1 tests cover balanced, skewed, symbol-valued, empty, and single-node trees. The S2 tests cover the assignment examples, nested empty lists, edge cases, a 10,000-element list, and nesting depth 100.

To demonstrate S2's input-reading public function, append a call to a temporary file and pipe the three inputs in order (`x`, `lst`, `n`):

```bash
cp code/12_q4.rkt /tmp/s2_demo.rkt
echo '(print-insert-result)' >> /tmp/s2_demo.rkt
printf '42\n((1 2) (3 4 5) (6) ())\n3\n' | racket /tmp/s2_demo.rkt
```

Expected output:

```text
((42 1 2) (3 4 5) (42 6) (42))
```

Temporary files in `/tmp/` are for testing and **are not part of the repository submission**. Do not append calls to the original files under `code/`.

## Development documentation

- `skills/prolog-dev/SKILL.md`: conventions, restrictions, testing guidance, and common failure modes for Prolog.
- `skills/scheme-dev/SKILL.md`: conventions, permitted built-ins, recursion, testing guidance, and common failure modes for Scheme.
- `prompts/P1.md`, `prompts/P2.md`, `prompts/S1.md`, `prompts/S2.md`: problem-specific AI prompt documentation. The assignment requires verbatim records of prompts actually used; retrospectively drafted examples must not be represented as original prompt history.
- `P1_REPORT.md`: explanation of why the eight original clues are ambiguous (`N = 3`) and how the additional valid clue yields one solution (`N = 1`).

## Submission notes

Submit the **GitHub repository link**, not a ZIP archive. Preserve the incremental Git commit history and use the required group-ID filenames. Confirm that all tests pass and the latest files have been pushed before submission.
