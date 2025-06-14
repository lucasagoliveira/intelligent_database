% population
query_biggest_population(X, PL) :-
    query_all_tables('N_INDIVIDUOS', L1),
    sort(2, @>=, L1, L2),
    clean_result(X, L2, PL).

query_biggest_population_percent(Percent, PL) :-
    query_all_tables('N_INDIVIDUOS', L1),
    length(L1, N),
    atom_number(Percent, P),
    X is ceiling(N * P / 100),
    sort(2, @>=, L1, L2),
    clean_result(X, L2, PL).

query_smallest_population(X, PL) :- 
    query_all_tables('N_INDIVIDUOS', L1),
    sort(2, @=<, L1, L2),
    clean_result(X, L2, PL).

query_smallest_population_percent(Percent, PL) :-
    query_all_tables('N_INDIVIDUOS', L1),
    length(L1, N),
    atom_number(Percent, P),
    X is ceiling(N * P / 100),
    sort(2, @=<, L1, L2),
    clean_result(X, L2, PL).

% area
query_biggest_area(X, PL) :-
    query_all_tables('SHAPE_Area', L1),
    sort(2, @>=, L1, L2),
    clean_result(X, L2, PL).

query_biggest_area_percent(Percent, PL) :-
    query_all_tables('SHAPE_Area', L1),
    length(L1, N),
    atom_number(Percent, P),
    X is ceiling(N * P / 100),
    sort(2, @>=, L1, L2),
    clean_result(X, L2, PL).

query_smallest_area(X, PL) :-
    query_all_tables('SHAPE_Area', L1),
    sort(2, @=<, L1, L2),
    clean_result(X, L2, PL).

query_smallest_area_percent(Percent, PL) :-
    query_all_tables('SHAPE_Area', L1),
    length(L1, N),
    atom_number(Percent, P),
    X is ceiling(N * P / 100),
    sort(2, @=<, L1, L2),
    clean_result(X, L2, PL).

% length
query_biggest_length(X, PL) :-
    query_all_tables('SHAPE_Length', L1),
    sort(2, @>=, L1, L2),
    clean_result(X, L2, PL).

query_biggest_length_percent(Percent, PL) :-
    query_all_tables('SHAPE_Length', L1),
    length(L1, N),
    atom_number(Percent, P),
    X is ceiling(N * P / 100),
    sort(2, @>=, L1, L2),
    clean_result(X, L2, PL).

query_smallest_length(X, PL) :-
    query_all_tables('SHAPE_Length', L1),
    sort(2, @=<, L1, L2),
    clean_result(X, L2, PL).

query_smallest_length_percent(Percent, PL) :-
    query_all_tables('SHAPE_Length', L1),
    length(L1, N),
    atom_number(Percent, P),
    X is ceiling(N * P / 100),
    sort(2, @=<, L1, L2),
    clean_result(X, L2, PL).

% accommodations
query_biggest_accommodations(X, PL) :-
    query_all_tables('N_ALOJAMENTOS_TOTAL', L1),
    sort(2, @>=, L1, L2),
    clean_result(X, L2, PL).

query_biggest_accommodations_percent(Percent, PL) :-
    query_all_tables('N_ALOJAMENTOS_TOTAL', L1),
    length(L1, N),
    atom_number(Percent, P),
    X is ceiling(N * P / 100),
    sort(2, @>=, L1, L2),
    clean_result(X, L2, PL).

query_smallest_accommodations(X, PL) :-
    query_all_tables('N_ALOJAMENTOS_TOTAL', L1),
    sort(2, @=<, L1, L2),
    clean_result(X, L2, PL).

query_smallest_accommodations_percent(Percent, PL) :-
    query_all_tables('N_ALOJAMENTOS_TOTAL', L1),
    length(L1, N),
    atom_number(Percent, P),
    X is ceiling(N * P / 100),
    sort(2, @=<, L1, L2),
    clean_result(X, L2, PL).


% latitude - place holders
query_biggest_latitude(X, R) :- R = "Melgaco".

query_smallest_latitude(X, R) :- R = "Funchal".

% longitude - place holders
query_biggest_longitude(X, R) :- R = "Miranda do Douro".

query_smallest_longitude(X, R) :- R = "Lajes das Flores".

% altitude
query_biggest_altitude(X, R) :- R = "Madalena".


% ----------- accessory rules -----------
parenthesize_list([], []).
parenthesize_list([H|T], [PH|PT]) :-
    format(atom(PH), '(~w)', [H]),
    parenthesize_list(T, PT).

take_how_many(N, List, Result) :-
    (   integer(N) -> N1 = N
    ;   atom(N) -> atom_number(N, N1)
    ;   string(N) -> number_string(N1, N)
    ),
    length(Result, N1),
    append(Result, _, List).

extract_first([], []).
extract_first([[F1, _]|T], [F1|FT]) :-
    extract_first(T, FT).

clean_result([], []).
clean_result(X, L, R) :-
    take_how_many(X, L, L1),
    extract_first(L1, L2),
    parenthesize_list(L2, R),
    write(R), nl.

query_all_tables(Col, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    findall([City, Pop],
        (
            member(Table, ['LUGARES21_MAD', 'LUGARES21_CONT', 'LUGARES21_AC25', 'LUGARES21_AC26']),
            format(atom(Q), "SELECT LUG21DESIG, ~w FROM ~w;", [Col, Table]),
            sqlite_query(Conn, Q, row(City, Pop))
        ),
        L
    ),
    sqlite_disconnect(Conn).