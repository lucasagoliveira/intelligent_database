:- use_module(library(prosqlite)).
:- consult('simple_queries.pl').  % Import the file simple_queries.pl
:- consult('comparative_queries.pl').  % Import the file comparative_queries.pl
:- consult('superlative_queries.pl').  % Import the file superlative_queries.pl

pattern(["how", "many", "people", "live", "in", P], [N, "people", "live", "in", P]) :- query_habitants(P, N), !.
pattern(["how", "many", "people", "live", "in", _], ["This", "city", "does", "not", "exist"]).
pattern(["how", "many", "accommodations", "are", "there", "in", P], ["There", "are", N, "accommodations", "in", P]) :- query_accommodations(P, N), !.
pattern(["how", "many", "accommodations", "are", "there", "in", _], ["This", "city", "does", "not", "exist"]).
pattern(["what", "is", "the", "area", "of", P], ["The", "area", "of", P, "is", N, "m^2"]) :- query_area(P, N), !. %TODO: convert to km^2
pattern(["what", "is", "the", "area", "of", _], ["This", "city", "does", "not", "exist"]).
pattern(["what", "is", "the", "length", "of", P], ["The", "length", "of", P, "is", N, "m"]) :- query_length(P, N), !. %TODO: convert to km 
pattern(["what", "is", "the", "length", "of", _], ["This", "city", "does", "not", "exist"]).

pattern(["between", A, "and", B, "what", "city", "is", "the", "biggest", "in", "population"], [C, "is", "bigger", "in", "population."]) :- query_biggest_population(A, B, C), check_existence(A, B), !.
pattern(["between", _, "and", _, "what", "city", "is", "the", "biggest", "in", "population"], ["One", "or", "both", of, "these", "cities", "do", "not", "exist"]).
pattern(["between", A, "and", B, "what", "city", "is", "the", "smallest", "in", "population"], [C, "is", "smaller", "in", "population."]) :- query_smallest_population(A, B, C), check_existence(A, B), !.
pattern(["between", _, "and", _, "what", "city", "is", "the", "smallest", "in", "population"], ["One", "or", "both", of, "these", "cities", "do", "not", "exist"]).
pattern(["between", A, "and", B, "what", "city", "is", "the", "biggest", "in", "area"], [C, "is", "bigger", "in", "area."]) :- query_biggest_area(A, B, C), check_existence(A, B), !.
pattern(["between", _, "and", _, "what", "city", "is", "the", "biggest", "in", "area"], ["One", "or", "both", of, "these", "cities", "do", "not", "exist"]).
pattern(["between", A, "and", B, "what", "city", "is", "the", "smallest", "in", "area"], [C, "is", "smaller", "in", "area."]) :- query_smallest_area(A, B, C), check_existence(A, B), !.
pattern(["between", _, "and", _, "what", "city", "is", "the", "smallest", "in", "area"], ["One", "or", "both", of, "these", "cities", "do", "not", "exist"]).
pattern(["between", A, "and", B, "what", "city", "is", "the", "biggest", "in", "length"], [C, "is", "bigger", "in", "length."]) :- query_biggest_length(A, B, C), check_existence(A, B), !.
pattern(["between", _, "and", _, "what", "city", "is", "the", "biggest", "in", "length"], ["One", "or", "both", of, "these", "cities", "do", "not", "exist"]).
pattern(["between", A, "and", B, "what", "city", "is", "the", "smallest", "in", "length"], [C, "is", "smaller", "in", "length."]) :- query_smallest_length(A, B, C), check_existence(A, B), !.
pattern(["between", _, "and", _, "what", "city", "is", "the", "smallest", "in", "length"], ["One", "or", "both", of, "these", "cities", "do", "not", "exist"]).
pattern(["between", A, "and", B, "what", "city", "is", "the", "biggest", "in", "accommodations"], [C, "is", "bigger", "in", "accommodations."]) :- query_most_accommodations(A, B, C), check_existence(A, B), !.
pattern(["between", _, "and", _, "what", "city", "is", "the", "biggest", "in", "accommodations"], ["One", "or", "both", of, "these", "cities", "do", "not", "exist"]).
pattern(["between", A, "and", B, "what", "city", "is", "the", "smallest", "in", "accommodations"], [C, "is", "smaller", "in", "accommodations."]) :- query_least_accommodations(A, B, C), check_existence(A, B), !.
pattern(["between", _, "and", _, "what", "city", "is", "the", "smallest", "in", "accommodations"], ["One", "or", "both", of, "these", "cities", "do", "not", "exist"]).

% what are the X(%) biggest cities in Portugal in population
pattern(["what", "are", "the", X, "biggest", "cities", "in", "population"], L) :- query_biggest_population(X, L), !.
pattern(["what", "are", "the", X, "percent", "biggest", "cities", "in", "population"], L) :- query_biggest_population_percent(X, L), !. %! Fix the "%"
% what are the X(%) smallest cities in Portugal in population
pattern(["what", "are", "the", X, "smallest", "cities", "in", "population"], L) :- query_smallest_population(X, L), !.
pattern(["what", "are", "the", X, "percent", "smallest", "cities", "in", "population"], L) :- query_smallest_population_percent(X, L), !. %! Fix the "%"
% what are the X(%) biggest cities in Portugal in area
pattern(["what", "are", "the", X, "biggest", "cities", "in", "area"], L) :- query_biggest_area(X, L), !.
pattern(["what", "are", "the", X, "percent", "biggest", "cities", "in", "area"], L) :- query_biggest_area_percent(X, L), !. %! Fix the "%"
% what are the X(%) smallest cities in Portugal in area
pattern(["what", "are", "the", X, "smallest", "cities", "in", "area"], L) :- query_smallest_area(X, L), !.
pattern(["what", "are", "the", X, "percent", "smallest", "cities", "in", "area"], L) :- query_smallest_area_percent(X, L), !. %! Fix the "%"
% what are the X(%) biggest cities in Portugal in length
pattern(["what", "are", "the", X, "biggest", "cities", "in", "length"], L) :- query_biggest_length(X, L), !.
pattern(["what", "are", "the", X, "percent", "biggest", "cities", "in", "length"], L) :- query_biggest_length_percent(X, L), !. %! Fix the "%"
% what are the X(%) smallest cities in Portugal in length
pattern(["what", "are", "the", X, "smallest", "cities", "in", "length"], L) :- query_smallest_length(X, L), !.
pattern(["what", "are", "the", X, "percent", "smallest", "cities", "in", "length"], L) :- query_smallest_length_percent(X, L), !. %! Fix the "%"
% what are the X(%) biggest cities in Portugal in accommodations
pattern(["what", "are", "the", X, "biggest", "cities", "in", "accommodations"], L) :- query_biggest_accommodations(X, L), !.
pattern(["what", "are", "the", X, "percent", "biggest", "cities", "in", "accommodations"], L) :- query_biggest_accommodations_percent(X, L), !. %! Fix the "%"
% what are the X(%) smallest cities in Portugal in accommodations
pattern(["what", "are", "the", X, "smallest", "cities", "in", "accommodations"], L) :- query_smallest_accommodations(X, L), !.
pattern(["what", "are", "the", X, "percent", "smallest", "cities", "in", "accommodations"], L) :- query_smallest_accommodations_percent(X, L), !. %! Fix the "%"

% in the table XPTO execute the query XYZ

% create a new table X with {query}

% biggest city in Portugal
pattern(["what", "is", "the", "biggest", "city", "in", "Portugal"], ["The", "biggest", "city", "in", "Portugal", "is", R]) :- query_biggest_area(1, R), !.      %! Fix this, R is a list, not an atom
% smallest city in Portugal
pattern(["what", "is", "the", "smallest", "city", "in", "Portugal"], ["The", "smallest", "city", "in", "Portugal", "is", R]) :- query_smallest_area(1, R), !.   %! Fix this, R is a list, not an atom
% most northern city in Portugal
pattern(["what", "is", "the", "most", "northern", "city", "in", "Portugal"], ["The", "most", "northern", "city", "in", "Portugal", "is", R]) :- query_biggest_latitude(1, R), !.    %! Fix this, R is a list, not an atom
% most southern city in Portugal
pattern(["what", "is", "the", "most", "southern", "city", "in", "Portugal"], ["The", "most", "southern", "city", "in", "Portugal", "is", R]) :- query_smallest_latitude(1, R), !.   %! Fix this, R is a list, not an atom
% most eastern city in Portugal
pattern(["what", "is", "the", "most", "eastern", "city", "in", "Portugal"], ["The", "most", "eastern", "city", "in", "Portugal", "is", R]) :- query_biggest_longitude(1, R), !.     %! Fix this, R is a list, not an atom
% most western city in Portugal
pattern(["what", "is", "the", "most", "western", "city", "in", "Portugal"], ["The", "most", "western", "city", "in", "Portugal", "is", R]) :- query_smallest_longitude(1, R), !.    %! Fix this, R is a list, not an atom
% hieghest city in Portugal
pattern(["what", "is", "the", "hieghest", "city", "in", "Portugal"], ["The", "hieghest", "city", "in", "Portugal", "is", R]) :- query_biggest_altitude(1, R), !.      %! Fix this, R is a list, not an atom