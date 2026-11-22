# P1 Report — Department Assignment Puzzle, Reloaded

**Course:** CS F301 — Principles of Programming Languages  
**Assignment:** 2 — Logic and Functional Programming  
**Group ID:** 12  
**Implementation:** `code/12_q1.pl`

## Number of solutions for clues 1–8

The original eight clues admit **three distinct valid assignments** of departments, favorite programming languages, and projects to the four friends.

The implemented predicate `count_solutions(Active, N)` checks **exactly** the clue numbers listed in `Active`. To obtain the result for the original puzzle, run:

```bash
swipl -q -f code/12_q1.pl -g "count_solutions([1,2,3,4,5,6,7,8],N),writeln(N)" -t halt
```

Expected result:

```text
3
```

**Interpretation:** The first eight clues do **not** determine a unique assignment; there are three assignments satisfying all eight clues.

## Ninth clue (repair)

The following ninth clue is implemented in `code/12_q1.pl`:

> **CLUE 9: The friend who prefers AI projects works in testing.**

The corresponding Prolog code is:

```prolog
% CLUE 9: The friend who prefers AI projects works in testing.
clue(9, Solution) :-
    member(p(_, testing, _, 'AI'), Solution).
```

The clue does not refer to any friend by name. It constrains a person through their **project preference** (`'AI'`) and **department** (`testing`), as required by the assignment.

## Number of solutions after repair

With the ninth clue added, exactly **one** of the three assignments satisfying the original eight clues remains valid.

Check this using:

```bash
swipl -q -f code/12_q1.pl -g "count_solutions([1,2,3,4,5,6,7,8,9],N),writeln(N)" -t halt
```

Expected result:

```text
1
```

## Summary

| Active clues | Number of valid assignments | Meaning |
|---|---:|---|
| 1–8 | **3** | Original puzzle is ambiguous. |
| 1–9 | **1** | Added clue selects a unique assignment. |

The ninth clue is consistent with one original solution and rules out the other two. Thus, the repaired puzzle has exactly one valid solution without naming any friend in the additional clue.
