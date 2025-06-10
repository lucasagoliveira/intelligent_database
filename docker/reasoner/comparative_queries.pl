:- consult('simple_queries.pl').

% Population
query_biggest_population(A, B, C) :-
    query_habitants(A, N1),
    query_habitants(B, N2),
    N1 > N2,
    C = A.

query_biggest_population(A, B, C) :-
    query_habitants(A, N1),
    query_habitants(B, N2),
    N1 =< N2,
    C = B.



query_smallest_population(A, B, C) :-
    query_biggest_population(A, B, R),
    R = A,
    C = B.

query_smallest_population(A, B, C) :-
    query_biggest_population(A, B, R),
    R = B,
    C = A.

% Area
query_biggest_area(A, B, C) :-
    query_area(A, N1),
    query_area(B, N2),
    N1 > N2,
    C = A.

query_biggest_area(A, B, C) :-
    query_area(A, N1),
    query_area(B, N2),
    N1 =< N2,
    C = B.



query_smallest_area(A, B, C) :-
    query_biggest_area(A, B, R),
    R = A,
    C = B.

query_smallest_area(A, B, C) :-
    query_biggest_area(A, B, R),
    R = B,
    C = A.

% Length
query_biggest_length(A, B, C) :-
    query_length(A, N1),
    query_length(B, N2),
    N1 > N2,
    C = A.

query_biggest_length(A, B, C) :-
    query_length(A, N1),
    query_length(B, N2),
    N1 =< N2,
    C = B.



query_smallest_length(A, B, C) :-
    query_biggest_length(A, B, R),
    R = A,
    C = B.

query_smallest_length(A, B, C) :-
    query_biggest_length(A, B, R),
    R = B,
    C = A.

% Accommodations
query_most_accommodations(A, B, C) :-
    query_accommodations(A, N1),
    query_accommodations(B, N2),
    N1 > N2,
    C = A.

query_most_accommodations(A, B, C) :-
    query_accommodations(A, N1),
    query_accommodations(B, N2),
    N1 =< N2,
    C = B.



query_least_accommodations(A, B, C) :-
    query_most_accommodations(A, B, R),
    R = A,
    C = B.

query_least_accommodations(A, B, C) :-
    query_most_accommodations(A, B, R),
    R = B,
    C = A.
