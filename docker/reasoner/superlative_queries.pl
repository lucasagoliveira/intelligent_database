% population
query_biggest_population(X, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, sum(N_INDIVIDUOS) AS n_people
        FROM (
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY n_people DESC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_biggest_population_percent(Percent, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(CountQuery), "SELECT COUNT(DISTINCT LUG21DESIG) FROM (
        SELECT LUG21DESIG FROM LUGARES21_MAD
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_CONT
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC25
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC26
    );", []),
    sqlite_query(Conn, CountQuery, row(TotalPlaces)),
    atom_number(Percent, P),
    X is ceiling(TotalPlaces * P / 100),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, sum(N_INDIVIDUOS) AS n_people
        FROM (
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY n_people DESC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_smallest_population(X, L) :- 
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, sum(N_INDIVIDUOS) AS n_people
        FROM (
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY n_people ASC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_smallest_population_percent(Percent, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(CountQuery), "SELECT COUNT(DISTINCT LUG21DESIG) FROM (
        SELECT LUG21DESIG FROM LUGARES21_MAD
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_CONT
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC25
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC26
    );", []),
    sqlite_query(Conn, CountQuery, row(TotalPlaces)),
    atom_number(Percent, P),
    X is ceiling(TotalPlaces * P / 100),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, sum(N_INDIVIDUOS) AS n_people
        FROM (
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, N_INDIVIDUOS FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY n_people ASC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

% area
query_biggest_area(X, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, max(SHAPE_Area) AS area
        FROM (
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY area DESC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_biggest_area_percent(Percent, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(CountQuery), "SELECT COUNT(DISTINCT LUG21DESIG) FROM (
        SELECT LUG21DESIG FROM LUGARES21_MAD
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_CONT
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC25
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC26
    );", []),
    sqlite_query(Conn, CountQuery, row(TotalPlaces)),
    atom_number(Percent, P),
    X is ceiling(TotalPlaces * P / 100),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, max(SHAPE_Area) AS area
        FROM (
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY area DESC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_smallest_area(X, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, max(SHAPE_Area) AS area
        FROM (
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY area ASC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_smallest_area_percent(Percent, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(CountQuery), "SELECT COUNT(DISTINCT LUG21DESIG) FROM (
        SELECT LUG21DESIG FROM LUGARES21_MAD
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_CONT
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC25
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC26
    );", []),
    sqlite_query(Conn, CountQuery, row(TotalPlaces)),
    atom_number(Percent, P),
    X is ceiling(TotalPlaces * P / 100),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, max(SHAPE_Area) AS area
        FROM (
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Area FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY area ASC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

% length
query_biggest_length(X, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, max(SHAPE_Length) AS length
        FROM (
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY length DESC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_biggest_length_percent(Percent, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(CountQuery), "SELECT COUNT(DISTINCT LUG21DESIG) FROM (
        SELECT LUG21DESIG FROM LUGARES21_MAD
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_CONT
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC25
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC26
    );", []),
    sqlite_query(Conn, CountQuery, row(TotalPlaces)),
    atom_number(Percent, P),
    X is ceiling(TotalPlaces * P / 100),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, max(SHAPE_Length) AS length
        FROM (
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY length DESC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_smallest_length(X, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, max(SHAPE_Length) AS length
        FROM (
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY length ASC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_smallest_length_percent(Percent, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(CountQuery), "SELECT COUNT(DISTINCT LUG21DESIG) FROM (
        SELECT LUG21DESIG FROM LUGARES21_MAD
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_CONT
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC25
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC26
    );", []),
    sqlite_query(Conn, CountQuery, row(TotalPlaces)),
    atom_number(Percent, P),
    X is ceiling(TotalPlaces * P / 100),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, max(SHAPE_Length) AS length
        FROM (
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, SHAPE_Length FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY length ASC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

% accommodations
query_biggest_accommodations(X, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, sum(N_ALOJAMENTOS_TOTAL) AS n_houses
        FROM (
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY n_houses DESC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_biggest_accommodations_percent(Percent, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(CountQuery), "SELECT COUNT(DISTINCT LUG21DESIG) FROM (
        SELECT LUG21DESIG FROM LUGARES21_MAD
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_CONT
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC25
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC26
    );", []),
    sqlite_query(Conn, CountQuery, row(TotalPlaces)),
    atom_number(Percent, P),
    X is ceiling(TotalPlaces * P / 100),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, sum(N_ALOJAMENTOS_TOTAL) AS n_houses
        FROM (
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY n_houses DESC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_smallest_accommodations(X, L) :- 
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, sum(N_ALOJAMENTOS_TOTAL) AS n_houses
        FROM (
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY n_houses ASC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).

query_smallest_accommodations_percent(Percent, L) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(CountQuery), "SELECT COUNT(DISTINCT LUG21DESIG) FROM (
        SELECT LUG21DESIG FROM LUGARES21_MAD
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_CONT
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC25
        UNION ALL
        SELECT LUG21DESIG FROM LUGARES21_AC26
    );", []),
    sqlite_query(Conn, CountQuery, row(TotalPlaces)),
    atom_number(Percent, P),
    X is ceiling(TotalPlaces * P / 100),
    format(atom(Query), "SELECT place FROM (
        SELECT LUG21DESIG AS place, sum(N_ALOJAMENTOS_TOTAL) AS n_houses
        FROM (
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_MAD
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_CONT
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC25
            UNION ALL
            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC26
        ) AS result
        GROUP BY place
        ORDER BY n_houses ASC
        LIMIT ~w
    );", [X]),
    findall(Row, sqlite_query(Conn, Query, row(Row)), L),
    sqlite_disconnect(Conn).


% latitude - place holders
query_biggest_latitude(X, R) :- R is ["Melgaco"].

query_smallest_latitude(X, R) :- R is ["Funchal"].

% longitude - place holders
query_biggest_longitude(X, R) :- R is ["Miranda", "do", "Douro"].

query_smallest_longitude(X, R) :- R is ["Lajes", "das", "Flores"].

% altitude
query_biggest_altitude(X, R) :- R is ["Madalena"].