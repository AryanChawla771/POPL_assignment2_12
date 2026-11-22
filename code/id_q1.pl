% ============================================
% CS F301 - Assignment 2
% Problem 1
% ============================================

:- use_module(library(lists)).

% ------------------------------------------------------------------
% solution_template(-Solution)
%
% Creates the basic structure of a solution.
%
% Solution is always a list of four people
% in the required order:
%
% Alex
% Ben
% Carla
% Dana
% ------------------------------------------------------------------

solution_template([
    p('Alex',  _, _, _),
    p('Ben',   _, _, _),
    p('Carla', _, _, _),
    p('Dana',  _, _, _)
]).
% ------------------------------------------------------------------
% unique_attributes(+Solution)
%
% Ensures that every department, language and project
% appears exactly once.
% ------------------------------------------------------------------


    
department(p(_, Department, _, _), Department).

language(p(_, _, Language, _), Language).

project(p(_, _, _, Project), Project).

person(Name, Solution, Person) :-
    member(Person, Solution),
    Person = p(Name, _, _, _).
% ------------------------------------------------------------------
% all_unique(+List)
%
% Succeeds if every element in List is unique.
% ------------------------------------------------------------------

all_unique([]).

all_unique([Head | Tail]) :-
    \+ member(Head, Tail),
    all_unique(Tail).
% ------------------------------------------------------------------
% unique_attributes(+Solution)
%
% Ensures that every department, language and project
% appears exactly once.
% ------------------------------------------------------------------

unique_attributes(Solution) :-
    maplist(department, Solution, Departments),
    all_unique(Departments),

    maplist(language, Solution, Languages),
    all_unique(Languages),

    maplist(project, Solution, Projects),
    all_unique(Projects).
% ------------------------------------------------------------------
% clue(1, +Solution)
%
% The friend who prefers the AI project
% does not work in research
% and is not Dana.
% ------------------------------------------------------------------

clue(1, Solution) :-
    member(p(Name, Department, _, 'AI'), Solution),
    Department \= research,
    Name \= 'Dana'.
% ------------------------------------------------------------------
% clue(2, +Solution)
%
% Alex does not work in development
% and does not prefer C++.
% ------------------------------------------------------------------

clue(2, Solution) :-
    person('Alex', Solution, p(_, Department, Language, _)),
    Department \= development,
    Language \= 'c++'.
