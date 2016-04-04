is_a_list([]).
is_a_list(.(Head,Tail)):-
        is_a_list(Tail).


%head_tail
head_tail(List,Head, Tail):-
        is_a_list(List),
        [Head|Tail] = List.

%base case
is_member(Element, list(Element, _)).

%recursive case (to be completed!)
%
is_member(Element, list(_, Tail1))   :-

        is_member(Element, Tail1).

%concat

cons([],B,B). %Adds the tail to the empty list.
cons([Head|Tail], B, [Head|C]):-
        cons(Tail,B,C).
%

% concat(List1, List2, Concat_List1_List2):
%   Concat_List1_List2 is the concatenation of List1 & List2
concat([], List2, List2).
concat([Item | Tail1], List2, [Item | Concat_Tail1_List2]) :-
      concat(Tail1, List2, Concat_Tail1_List2).
