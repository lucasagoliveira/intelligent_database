query_habitants(City, NumPeople) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "with result as
                        (SELECT LUG21DESIG as place, N_INDIVIDUOS FROM LUGARES21_MAD
                        UNION
                        SELECT LUG21DESIG as place, N_INDIVIDUOS FROM LUGARES21_CONT
                        UNION
                        SELECT LUG21DESIG as place, N_INDIVIDUOS FROM LUGARES21_AC25
                        UNION
                        SELECT LUG21DESIG as place, N_INDIVIDUOS FROM LUGARES21_AC26)
                        select sum(N_INDIVIDUOS) from result WHERE place = '~w' group by place;",
                        [City]),
    sqlite_query(Conn, Query, row(NumPeople)),
    sqlite_disconnect(Conn).

query_accommodations(City, NumPeople) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "with result as
                        (SELECT LUG21DESIG as place, N_ALOJAMENTOS_TOTAL FROM LUGARES21_MAD
                        UNION
                        SELECT LUG21DESIG as place, N_ALOJAMENTOS_TOTAL FROM LUGARES21_CONT
                        UNION
                        SELECT LUG21DESIG as place, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC25
                        UNION
                        SELECT LUG21DESIG as place, N_ALOJAMENTOS_TOTAL FROM LUGARES21_AC26)
                        select sum(N_ALOJAMENTOS_TOTAL) from result WHERE place = '~w' group by place;",
                        [City]),
    sqlite_query(Conn, Query, row(NumPeople)),
    sqlite_disconnect(Conn).

query_area(City, NumPeople) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "with result as
                        (SELECT LUG21DESIG as place, SHAPE_Area FROM LUGARES21_MAD
                        UNION
                        SELECT LUG21DESIG as place, SHAPE_Area FROM LUGARES21_CONT
                        UNION
                        SELECT LUG21DESIG as place, SHAPE_Area FROM LUGARES21_AC25
                        UNION
                        SELECT LUG21DESIG as place, SHAPE_Area FROM LUGARES21_AC26)
                        select max(SHAPE_Area) from result WHERE place = '~w' group by place;",
                        [City]),
    sqlite_query(Conn, Query, row(NumPeople)),
    sqlite_disconnect(Conn).

query_length(City, NumPeople) :-
    sqlite_connect('LUGARES21_PORTUGAL', Conn, [mode(read)]),
    format(atom(Query), "with result as
                        (SELECT LUG21DESIG as place, SHAPE_Length FROM LUGARES21_MAD
                        UNION
                        SELECT LUG21DESIG as place, SHAPE_Length FROM LUGARES21_CONT
                        UNION
                        SELECT LUG21DESIG as place, SHAPE_Length FROM LUGARES21_AC25
                        UNION
                        SELECT LUG21DESIG as place, SHAPE_Length FROM LUGARES21_AC26)
                        select max(SHAPE_Length) from result WHERE place = '~w' group by place;",
                        [City]),
    sqlite_query(Conn, Query, row(NumPeople)),
    sqlite_disconnect(Conn).

check_existence(City) :-
    query_area(City, _).
check_existence(CityA, CityB) :-
    query_area(CityA, _),
    query_area(CityB, _).