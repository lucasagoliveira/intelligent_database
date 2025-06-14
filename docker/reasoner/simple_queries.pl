query_habitants(City, NumPeople) :-
    query_all_tables('N_INDIVIDUOS', L),
    atom_string(C, City),
    findall(N, member([C, N], L), Ns),
    sum_list(Ns, NumPeople).

query_accommodations(City, NumPeople) :-
    query_all_tables('N_ALOJAMENTOS_TOTAL', L),
    atom_string(C, City),
    findall(N, member([C, N], L), Ns),
    sum_list(Ns, NumPeople).

query_area(City, NumPeople) :-
    query_all_tables('SHAPE_Area', L),
    atom_string(C, City),
    findall(N, member([C, N], L), Ns),
    max_list(Ns, NumPeople).

query_length(City, NumPeople) :-
    query_all_tables('SHAPE_Length', L),
    atom_string(C, City),
    findall(N, member([C, N], L), Ns),
    max_list(Ns, NumPeople).



% ----------- accessory rules -----------
check_existence(City) :-
    query_area(City, _).
check_existence(CityA, CityB) :-
    query_area(CityA, _),
    query_area(CityB, _).

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