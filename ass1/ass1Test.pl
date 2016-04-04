%Test cases for assignment 1


%test case for question1

sumsq_even([], Sum).
%Sum = 0
sumsq_even([0], Sum).
%Sum = 0
sumsq_even([1], Sum).
%Sum = 0
sumsq_even([2], Sum).
%Sum = 4
sumsq_even([1,2,3,4,5,6,7,8],Sum).
%Sum = 120
sumsq_even([-1,-2,-3,-4,-5,-6,-7,-8],Sum).
%Sum = 120


%test case for question2

all_like(apple,[A]).
%A = mary ;
%A = tim ;
%A = jane ;
false.

all_like(apple,A).
%A = [mary]
%A = [mary, mary] and so on with more mary.
%is this okay? or should it be restricted?

%other relevant testcases?
%remove the member part if not required.





