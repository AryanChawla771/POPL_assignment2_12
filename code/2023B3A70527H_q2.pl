% P2: Form a Valid Arithmetic Equation
% Libraries: lists only.
% Expression trees: leaf(N) or bin(Op, Left, Right), Op in {+,-,*,/}.

:- use_module(library(lists)).

% ---------------------------------------------------------------
% Unit 1: apply_op(+Op, +A, +B, -V)
% V is A Op B. Division only when the divisor is non-zero and exact.
% ---------------------------------------------------------------
apply_op(+, A, B, V) :- V is A + B.
apply_op(-, A, B, V) :- V is A - B.
apply_op(*, A, B, V) :- V is A * B.
apply_op(/, A, B, V) :- B =\= 0, A mod B =:= 0, V is A // B.

% ---------------------------------------------------------------
% Unit 2: expr(+Numbers, -Tree, -Value)
% Tree is an expression over ALL of Numbers (non-empty, in order),
% and Value is its integer value. Every sub-division must be exact.
% ---------------------------------------------------------------
expr([N], leaf(N), N).
expr(Ns, bin(Op, TL, TR), V) :-
    split(Ns, L, R),
    expr(L, TL, VL),
    expr(R, TR, VR),
    apply_op(Op, VL, VR, V).

% split(+List, -Left, -Right): both parts non-empty, Left ++ Right = List.
split(List, L, R) :-
    append(L, R, List),
    L = [_|_],
    R = [_|_].

% ---------------------------------------------------------------
% Unit 3: canonical printing. fmt(+Tree, -String)
% ---------------------------------------------------------------
prec(+, 1).
prec(-, 1).
prec(*, 2).
prec(/, 2).

fmt(leaf(N), S) :-
    format(string(S), "~d", [N]).
fmt(bin(Op, L, R), S) :-
    prec(Op, P),
    fmt(L, SL0),
    fmt(R, SR0),
    % left operand: parentheses only if its operator binds looser
    (   L = bin(OL, _, _), prec(OL, PL), PL < P
    ->  format(string(SL), "(~w)", [SL0])
    ;   SL = SL0
    ),
    % right operand: parentheses if its operator binds the same or looser
    (   R = bin(OR, _, _), prec(OR, PR), PR =< P
    ->  format(string(SR), "(~w)", [SR0])
    ;   SR = SR0
    ),
    format(string(S), "~w~w~w", [SL, Op, SR]).

% ---------------------------------------------------------------
% Unit 4: equation(+List, -String)
% Split List into a non-empty left part and a non-empty right part,
% build an expression for each, require equal values, and print.
% ---------------------------------------------------------------
equation(List, S) :-
    split(List, L, R),
    expr(L, TL, V),
    expr(R, TR, V),
    fmt(TL, SL),
    fmt(TR, SR),
    format(string(S), "~w=~w", [SL, SR]).

% ---------------------------------------------------------------
% P2.a: generate_equation(+List, -Equation)
% One valid equation; fails if none exists (including length 0 or 1).
% ---------------------------------------------------------------
generate_equation(List, Equation) :-
    once(equation(List, Equation)).

% ---------------------------------------------------------------
% P2.b: all_equations/2 and count_equations/2
% ---------------------------------------------------------------
all_equations(List, Equations) :-
    findall(S, equation(List, S), Ss),
    sort(Ss, Equations).

count_equations(List, N) :-
    all_equations(List, Es),
    length(Es, N).
