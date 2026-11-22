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
% Allowed attribute values
% ------------------------------------------------------------------

departments([research, development, design, testing]).

languages([python, java, 'c++', javascript]).

projects(['AI', web, embedded, data]).
% ------------------------------------------------------------------
% assign_attributes(+Solution)
%
% Assigns a valid department, language and project
% to every person.
% ------------------------------------------------------------------

assign_attributes([]).

assign_attributes([p(_, Department, Language, Project) | Rest]) :-
    departments(Departments),
    languages(Languages),
    projects(Projects),

    member(Department, Departments),
    member(Language, Languages),
    member(Project, Projects),

    assign_attributes(Rest).
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
% ------------------------------------------------------------------
% clue(3, +Solution)
%
% The friend working in the testing department
% likes Python.
% ------------------------------------------------------------------

clue(3, Solution) :-
    member(p(_, testing, Language, _), Solution),
    Language = python.
% ------------------------------------------------------------------
% clue(4, +Solution)
%
% Ben prefers web projects
% and does not work in testing.
% ------------------------------------------------------------------

clue(4, Solution) :-
    person('Ben', Solution, p(_, Department, _, Project)),
    Department \= testing,
    Project = web.
% ------------------------------------------------------------------
% clue(5, +Solution)
%
% The friend whose favorite language is Java
% works in the design department.
% ------------------------------------------------------------------

clue(5, Solution) :-
    member(p(_, Department, java, _), Solution),
    Department = design.
% ------------------------------------------------------------------
% clue(6, +Solution)
%
% Carla's project preference is not embedded
% and her department is not development.
% ------------------------------------------------------------------

clue(6, Solution) :-
    person('Carla', Solution, p(_, Department, _, Project)),
    Department \= development,
    Project \= embedded.
% ------------------------------------------------------------------
% clue(7, +Solution)
%
% Dana's favorite language is not Java,
% and she works in research or testing.
% ------------------------------------------------------------------

clue(7, Solution) :-
    person('Dana', Solution, p(_, Department, Language, _)),
    Language \= java,
    (Department = research ; Department = testing).
% ------------------------------------------------------------------
% clue(8, +Solution)
%
% The friend who prefers data projects
% works in research
% and does not use JavaScript.
% ------------------------------------------------------------------

clue(8, Solution) :-
    member(p(_, Department, Language, data), Solution),
    Department = research,
    Language \= javascript.
% ------------------------------------------------------------------
% clue(9, +Solution)
%
% Alex prefers the AI project.
% ------------------------------------------------------------------

clue(9, Solution) :-
    person('Alex', Solution, p(_, _, _, 'AI')).
% ------------------------------------------------------------------
% apply_clues(+Solution)
%
% Applies all puzzle constraints.
% ------------------------------------------------------------------

apply_clues(Solution) :-
    clue(1, Solution),
    clue(2, Solution),
    clue(3, Solution),
    clue(4, Solution),
    clue(5, Solution),
    clue(6, Solution),
    clue(7, Solution),
    clue(8, Solution),
    clue(9, Solution).
% ------------------------------------------------------------------
% solve(-Solution)
%
% Generates a valid solution satisfying
% all puzzle constraints.
% ------------------------------------------------------------------

solve(Solution) :-
    solution_template(Solution),
    assign_attributes(Solution),
    unique_attributes(Solution),
    apply_clues(Solution).
% ------------------------------------------------------------------
% main/0
%
% Finds and prints one valid solution.
% ------------------------------------------------------------------

main :-
    solve(Solution),
    writeln(Solution).
% ------------------------------------------------------------------
% count_solutions(+Goal, -Count)
%
% Counts the number of solutions produced by Goal.
% ------------------------------------------------------------------

count_solutions(Goal, Count) :-
    findall(Goal, Goal, Solutions),
    length(Solutions, Count).
