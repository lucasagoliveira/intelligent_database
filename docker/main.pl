:- consult('./reasoner/patterns.pl').  % Import the file pattern.pl

string_to_array(X,R) :- split_string(X," ","",R).     % Converter String para array
array_to_string(X,R) :- atomic_list_concat(X," ",R).  % Converter array para String

remove_trailing_question(InputAtom, OutputAtom) :-
    atom_chars(InputAtom, CharList),
    remove_trailing_q(CharList, CleanList),
    atom_chars(OutputAtom, CleanList).

remove_trailing_q(['?'|[]], []) :- !.
remove_trailing_q(List, List) :- append(_, [Last], List), Last \= '?', !.
remove_trailing_q(List, Cleaned) :-
    append(Prefix, ['?'], List),
    Cleaned = Prefix.

read_input(Input,R) :- read_line_to_string(user_input, Input), remove_trailing_question(Input, CleanedInput), string_to_array(CleanedInput,R).  % Read user entry

loop(true) :- 
    read_input(Input, List),
    Input \= "Bye",
    Input \= "bye",
    process_input(List, R1),
    array_to_string(R1, R),
    write('Result: '), write(R), nl,
    loop(true).

loop(false) :-
    write('Goodbye!'), nl, !.

process_input(L, R) :-
    pattern(L, R), !.

process_input(_, ['Invalid', 'input!']).

:- loop(true).