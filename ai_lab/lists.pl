is_a_list([]).
is_a_list(.(Head,Tail)):-
	is_a_list(Tail).
