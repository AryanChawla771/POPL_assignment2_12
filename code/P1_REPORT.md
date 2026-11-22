# Problem 1 Report

## Additional Clue

**Clue 9:**

> Alex prefers the AI project.

Implementation:

```prolog
clue(9, Solution) :-
    person('Alex', Solution, p(_, _, _, 'AI')).
```

## Justification

After implementing the original eight clues, the puzzle admitted **three** valid solutions.

To make the puzzle have a unique solution, I added the clue **"Alex prefers the AI project."** This clue is consistent with the existing puzzle and eliminates the remaining ambiguous solutions without contradicting any of the original clues.

## Results

Number of valid solutions before adding Clue 9:

```
3
```

Number of valid solutions after adding Clue 9:

```
1
```

The final implementation therefore satisfies all original clues and produces exactly one valid solution.
