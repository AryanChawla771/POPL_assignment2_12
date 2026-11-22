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
