%Name: Wei Yew Teoh
%ZID: z3365404
%Assignment1 - Prolog Programming
%
%
%

%===================DELETE BEFORE SUBMIT=============%
likes(mary, apple).
likes(mary, pear).
likes(mary, grapes).
likes(tim, mango).
likes(tim, apple).
likes(jane, apple).
likes(jane, mango).



%question1 
%sumsq_even(Numbers,Sum)
%sums the squares of omly the even number in a list.

%if list is empty, return 0
sumsq_even([],0).

%else if the first element is odd, ignore
sumsq_even([H|T],Count):-
	sumsq_even(T, CountBuf),
	1 is H mod 2,
	Count is CountBuf.


%else if the first element is even perform action
sumsq_even([H|T], Count):-
	sumsq_even(T, CountBuf),
	0 is H mod 2,
	Count is CountBuf + H * H.


%question2
%all_like(What,List) returns a true or false if List contains only persons that like What.

%Returns true for empty list
all_like(What, []).

%else evaluate head and calls itself recursively with tail of List.
all_like(What, [A|B]):-
	likes(A, What),
	all_like(What, B).


%question3
%sqrt_table(N,M,Result) binds Result to list of pairs consisting of a number and its squreroot from N down to M.
%N and m are non-negative and N >= M.
%Based on assumptions, no checks involved.


%base case, when N is equal to M
sqrt_table(N,M,Result):-
	N = M,
	A is sqrt(N),
	Result = .(.(N,.(A,[])),[]).

%when N is still greater than M
sqrt_table(N,M,Result):-
	N > M,
	X is N -1,
	sqrt_table(X, M, ResultBuf),
	A is sqrt(N),
	Result = .(.(N,.(A,[])),ResultBuf).


%question4
%sequences of successive decreasing numbers replaced by last number in sequence.
%Example
%chop_down([10,9,8,7,6,5,9],Result).
%Result = [5, 9].

%Empty List return empty.
chop_down([], []).

%List has 1 element
chop_down([H|[]], .(H,[])).

%when (i+1)th element is successive decreasing of ith element
%list has atleast 2 elements
chop_down([A|[B|C]], NewList):-
	D is B + 1,
	A = D,
	chop_down([B|C],NewList).

%when (i+1)th element is not successive decreasing of ith element
%list has atleast 2 elements
chop_down([A|[B|C]], NewList):-
	D is B + 1,
	A \= D,
	chop_down([B|C], NewListBuf),
	NewList = .(A, NewListBuf).


%question5
%tree_eval(Value, Tree, Eval)
%Eval binds to the result of evaluating the expression-tree, with the variable z set equal to the pecified value.

%if empty tree return 0
tree_eval(Value, tree(empty), 0).

%if Num is z return Value
tree_eval(Value, tree(empty, Num, empty), Eval):-
	Num = z,
	Eval = Value.

%if Num is a number return number
tree_eval(Value, tree(empty, Num, empty), Eval):-
	Num \= z,
	Eval = Num.

%if not a leaf but of the form tree(L, Op, R).
%if op = '+'
tree_eval(Value, tree(L, Op, R), Eval):-
	Op = +,
	tree_eval(Value, L, EvalL),
	tree_eval(Value, R, EvalR),
	Eval is EvalL + EvalR.

%if op = '-'
tree_eval(Value, tree(L, Op, R), Eval):-
	Op = -,
	tree_eval(Value, L, EvalL),
	tree_eval(Value, R, EvalR),
	Eval is EvalL - EvalR.

%if op = '*'
tree_eval(Value, tree(L, Op, R), Eval):-
	Op = *,
	tree_eval(Value, L, EvalL),
	tree_eval(Value, R, EvalR),
	Eval is EvalL * EvalR.

%if op = '/'
tree_eval(Value, tree(L, Op, R), Eval):-
	Op = '/',
	tree_eval(Value, L, EvalL),
	tree_eval(Value, R, EvalR),
	Eval is EvalL / EvalR.


	

