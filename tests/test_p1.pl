% Tests for CS F301 P1. Do not insert these tests into the solution file.
% Run from repository root:
% swipl -q -s tests/test_p1.pl -g run_tests -t halt

:- ['../code/12_q1.pl'].

check(Name, Goal) :-
    (   catch(once(Goal), Error,
              ( format('ERROR ~w: ~w~n', [Name, Error]), fail ))
    ->  format('PASS ~w~n', [Name])
    ;   format('FAIL ~w~n', [Name]), fail
    ).

run_tests :-
    (   run_all_tests
    ->  writeln('P1: ALL TESTS PASSED')
    ;   writeln('P1: TESTS FAILED'), fail
    ).

run_all_tests :-
    check('Original 8 clues have 3 solutions',
          count_solutions([1,2,3,4,5,6,7,8], 3)),
    check('Clue 9 makes the solution unique',
          count_solutions([1,2,3,4,5,6,7,8,9], 1)),
    check('Empty clue subset has 13824 assignments',
          count_solutions([], 13824)),
    check('Clue 9 alone leaves 3456 assignments',
          count_solutions([9], 3456)),
    check('Solve uses only first 8 clues',
          ( solve(S8), clue(1,S8), clue(2,S8), clue(3,S8),
            clue(4,S8), clue(5,S8), clue(6,S8),
            clue(7,S8), clue(8,S8) )),

    check('The repaired solution satisfies clue 9',
          ( solve_with_clues([1,2,3,4,5,6,7,8,9], S9),
            clue(9, S9) )),

    check('Solution has four people in required order',
          ( solve(SOrder),
            SOrder = [p('Alex',_,_,_),p('Ben',_,_,_),
                      p('Carla',_,_,_),p('Dana',_,_,_)] )).