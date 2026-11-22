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

% Choose each attribute exactly once as the people are assigned.
% select/3 is provided by the permitted lists library. This avoids
% enumerating 4^12 combinations and filtering duplicates afterward.
assign_attributes(Solution) :-
    departments(Departments),
    languages(Languages),
    projects(Projects),
    assign_unique(Solution, Departments, Languages, Projects).

assign_unique([], [], [], []).
assign_unique([p(_, Department, Language, Project) | Rest],
              Departments, Languages, Projects) :-
    select(Department, Departments, RemainingDepartments),
    select(Language, Languages, RemainingLanguages),
    select(Project, Projects, RemainingProjects),
    assign_unique(Rest, RemainingDepartments, RemainingLanguages,
                  RemainingProjects).

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
% Clue 9 distinguishes one of the solutions satisfying clues 1..8.
% CLUE 9: The friend who prefers AI projects works in testing.
clue(9, Solution) :-
    member(p(_, testing, _, 'AI'), Solution).

% apply_active_clues(+Active, +Solution)
% Apply exactly the clue numbers requested by the caller.
apply_active_clues([], _).
apply_active_clues([Number | Rest], Solution) :-
    clue(Number, Solution),
    apply_active_clues(Rest, Solution).

% solve_with_clues(+Active, -Solution)
% Enumerates fully assigned, unique attribute combinations.
solve_with_clues(Active, Solution) :-
    solution_template(Solution),
    assign_attributes(Solution),
    unique_attributes(Solution),
    apply_active_clues(Active, Solution).

% solve(-Solution) produces a solution to the original eight clues.
solve(Solution) :-
    solve_with_clues([1,2,3,4,5,6,7,8], Solution).

% Print a single person's attributes in the required format.
print_person(p(Name, Department, Language, Project)) :-
    format('~w = [~w, ~w, ~w]~n',
           [Name, Department, Language, Project]).

% main/0 prints a solution to clues 1..8 in the required order.
main :-
    once(solve(Solution)),
    Solution = [Alex, Ben, Carla, Dana],
    print_person(Alex),
    print_person(Ben),
    print_person(Carla),
    print_person(Dana).

% count_solutions(+Active, -N) counts solutions to exactly Active.
count_solutions(Active, N) :-
    findall(Solution,
            solve_with_clues(Active, Solution),
            Solutions),
    length(Solutions, N).
