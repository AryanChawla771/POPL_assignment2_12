% Tests for CS F301 P2, based on the assignment's public predicate API.
% Run from repository root:
% swipl -q -s tests/test_p2.pl -g run_tests -t halt


:- ['../code/12_q2.pl'].

check(Name, Goal) :-
    (   catch(once(Goal), Error,
              ( format('ERROR ~w: ~w~n', [Name, Error]), fail ))
    ->  format('PASS ~w~n', [Name])
    ;   format('FAIL ~w~n', [Name]), fail
    ).

run_tests :-
    (   run_all_tests
    ->  writeln('P2: ALL TESTS PASSED')
    ;   writeln('P2: TESTS FAILED'), fail
    ).

run_all_tests :-
    check('Seven expected equations, exact sorted list',
          ( all_equations([4,2,5,3], Actual),
            Actual = ["4*2-5=3", "4*2=5+3", "4-2=5-3",
                      "4/2=5-3", "4=2*(5-3)",
                      "4=2+(5-3)", "4=2+5-3"] )),
    check('Seven equations counted',
          count_equations([4,2,5,3], 7)),
    check('Generate one equation as an SWI-Prolog string',
          ( generate_equation([4,2,5,3], E),
            string(E),
            member(E,["4*2-5=3", "4*2=5+3", "4-2=5-3",
                      "4/2=5-3", "4=2*(5-3)",
                      "4=2+(5-3)", "4=2+5-3"]) )),
    check('No equation for [2,3,4]',
          all_equations([2,3,4], [])),
    check('No generated equation for [2,3,4]',
          \+ generate_equation([2,3,4], _)),
    check('One equation for [2,4,8]',
          all_equations([2,4,8], ["2*4=8"])),
    check('Count one equation for [2,4,8]',
          count_equations([2,4,8], 1)),
    check('Empty input returns no equations',
          all_equations([], [])),
    check('Singleton returns no equations',
          all_equations([4], [])),
    check('Empty input cannot generate an equation',
          \+ generate_equation([], _)),
    check('Singleton cannot generate an equation',
          \+ generate_equation([4], _)),
    check('Two matching single numbers form an equation',
          all_equations([1,1], ["1=1"])),
    check('Two unequal single numbers cannot form an equation',
          all_equations([0,1], [])),
    check('Count empty case is zero',
          count_equations([], 0)),
    check('No duplicates and sorted order in public example',
          ( all_equations([4,2,5,3], Es),
            sort(Es, Es) )).
