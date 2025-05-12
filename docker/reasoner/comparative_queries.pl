% Population
query_biggest_population(A, B, C) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place
                        FROM (
                        SELECT LUG21DESIG AS place, sum(N_INDIVIDUOS) AS n_people
                        FROM (
                            SELECT LUG21DESIG, N_INDIVIDUOS
                            FROM LUGARES21_MAD
                            UNION
                            SELECT LUG21DESIG, N_INDIVIDUOS
                            FROM LUGARES21_CONT
                            UNION
                            SELECT LUG21DESIG, N_INDIVIDUOS
                            FROM LUGARES21_AC25
                            UNION
                            SELECT LUG21DESIG, N_INDIVIDUOS
                            FROM LUGARES21_AC26
                        ) AS result
                        WHERE place IN ('~w', '~w')
                        GROUP BY place
                        ORDER BY n_people DESC
                        LIMIT 1
                        );",
                        [A, B]),
    sqlite_query(Conn, Query, row(C)),
    sqlite_disconnect(Conn).

query_smallest_population(A, B, C) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place
                        FROM (
                        SELECT LUG21DESIG AS place, sum(N_INDIVIDUOS) AS n_people
                        FROM (
                            SELECT LUG21DESIG, N_INDIVIDUOS
                            FROM LUGARES21_MAD
                            UNION
                            SELECT LUG21DESIG, N_INDIVIDUOS
                            FROM LUGARES21_CONT
                            UNION
                            SELECT LUG21DESIG, N_INDIVIDUOS
                            FROM LUGARES21_AC25
                            UNION
                            SELECT LUG21DESIG, N_INDIVIDUOS
                            FROM LUGARES21_AC26
                        ) AS result
                        WHERE place IN ('~w', '~w')
                        GROUP BY place
                        ORDER BY n_people ASC
                        LIMIT 1
                        );",
                        [A, B]),
    sqlite_query(Conn, Query, row(C)),
    sqlite_disconnect(Conn).

% Area
query_biggest_area(A, B, C) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place
                        FROM (
                        SELECT LUG21DESIG AS place, max(SHAPE_Area) AS area
                        FROM (
                            SELECT LUG21DESIG, SHAPE_Area
                            FROM LUGARES21_MAD
                            UNION
                            SELECT LUG21DESIG, SHAPE_Area
                            FROM LUGARES21_CONT
                            UNION
                            SELECT LUG21DESIG, SHAPE_Area
                            FROM LUGARES21_AC25
                            UNION
                            SELECT LUG21DESIG, SHAPE_Area
                            FROM LUGARES21_AC26
                        ) AS result
                        WHERE place IN ('~w', '~w')
                        GROUP BY place
                        ORDER BY area DESC
                        LIMIT 1
                        );",
                        [A, B]),
    sqlite_query(Conn, Query, row(C)),
    sqlite_disconnect(Conn).

query_smallest_area(A, B, C) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place
                        FROM (
                        SELECT LUG21DESIG AS place, max(SHAPE_Area) AS area
                        FROM (
                            SELECT LUG21DESIG, SHAPE_Area
                            FROM LUGARES21_MAD
                            UNION
                            SELECT LUG21DESIG, SHAPE_Area
                            FROM LUGARES21_CONT
                            UNION
                            SELECT LUG21DESIG, SHAPE_Area
                            FROM LUGARES21_AC25
                            UNION
                            SELECT LUG21DESIG, SHAPE_Area
                            FROM LUGARES21_AC26
                        ) AS result
                        WHERE place IN ('~w', '~w')
                        GROUP BY place
                        ORDER BY area ASC
                        LIMIT 1
                        );",
                        [A, B]),
    sqlite_query(Conn, Query, row(C)),
    sqlite_disconnect(Conn).

% Length
query_biggest_length(A, B, C) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place
                        FROM (
                        SELECT LUG21DESIG AS place, max(SHAPE_Length) AS length
                        FROM (
                            SELECT LUG21DESIG, SHAPE_Length
                            FROM LUGARES21_MAD
                            UNION
                            SELECT LUG21DESIG, SHAPE_Length
                            FROM LUGARES21_CONT
                            UNION
                            SELECT LUG21DESIG, SHAPE_Length
                            FROM LUGARES21_AC25
                            UNION
                            SELECT LUG21DESIG, SHAPE_Length
                            FROM LUGARES21_AC26
                        ) AS result
                        WHERE place IN ('~w', '~w')
                        GROUP BY place
                        ORDER BY length DESC
                        LIMIT 1
                        );",
                        [A, B]),
    sqlite_query(Conn, Query, row(C)),
    sqlite_disconnect(Conn).

query_smallest_length(A, B, C) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place
                        FROM (
                        SELECT LUG21DESIG AS place, max(SHAPE_Length) AS length
                        FROM (
                            SELECT LUG21DESIG, SHAPE_Length
                            FROM LUGARES21_MAD
                            UNION
                            SELECT LUG21DESIG, SHAPE_Length
                            FROM LUGARES21_CONT
                            UNION
                            SELECT LUG21DESIG, SHAPE_Length
                            FROM LUGARES21_AC25
                            UNION
                            SELECT LUG21DESIG, SHAPE_Length
                            FROM LUGARES21_AC26
                        ) AS result
                        WHERE place IN ('~w', '~w')
                        GROUP BY place
                        ORDER BY length ASC
                        LIMIT 1
                        );",
                        [A, B]),
    sqlite_query(Conn, Query, row(C)),
    sqlite_disconnect(Conn).

% Accommodations
query_most_accommodations(A, B, C) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place
                        FROM (
                        SELECT LUG21DESIG AS place, sum(N_ALOJAMENTOS_TOTAL) AS houses
                        FROM (
                            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL
                            FROM LUGARES21_MAD
                            UNION
                            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL
                            FROM LUGARES21_CONT
                            UNION
                            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL
                            FROM LUGARES21_AC25
                            UNION
                            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL
                            FROM LUGARES21_AC26
                        ) AS result
                        WHERE place IN ('~w', '~w')
                        GROUP BY place
                        ORDER BY houses DESC
                        LIMIT 1
                        );",
                        [A, B]),
    sqlite_query(Conn, Query, row(C)),
    sqlite_disconnect(Conn).

query_least_accommodations(A, B, C) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "SELECT place
                        FROM (
                        SELECT LUG21DESIG AS place, sum(N_ALOJAMENTOS_TOTAL) AS houses
                        FROM (
                            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL
                            FROM LUGARES21_MAD
                            UNION
                            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL
                            FROM LUGARES21_CONT
                            UNION
                            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL
                            FROM LUGARES21_AC25
                            UNION
                            SELECT LUG21DESIG, N_ALOJAMENTOS_TOTAL
                            FROM LUGARES21_AC26
                        ) AS result
                        WHERE place IN ('~w', '~w')
                        GROUP BY place
                        ORDER BY houses ASC
                        LIMIT 1
                        );",
                        [A, B]),
    sqlite_query(Conn, Query, row(C)),
    sqlite_disconnect(Conn).