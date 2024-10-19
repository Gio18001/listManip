-module(listManip).

% Export all the functions
-export([lengthCheck_s/1, combine_s/2, reverse_s/1, palindrome_s/1, lengthCheck/1, combine/2, reverse/1, reverse/2, palindrome/1]).

% Function spawns
lengthCheck_s(A) ->
    spawn(fun() -> lengthCheck(A) end).

combine_s(A, B) ->
    spawn(fun() -> combine(A, B) end).

reverse_s(A) ->
    spawn(fun() -> reverse(A) end).

palindrome_s(A) ->
    spawn(fun() -> palindrome(A) end).


% function implementations

% Will give errors if the given list is not a list or is empty 
lengthCheck(A) when not is_list(A) ->
    throw({error, is_not_list});
lengthCheck([]) ->
    io:format("Given list is empty.~n");
% Returns length of the list using the length() function
lengthCheck(A) ->
	length(A).

% Will give errors if either of the given lists are not a list or are empty
combine(A, B) when not is_list(A); not is_list(B) ->
    throw({error, is_not_list});
combine(A, B) when A == []; B == [] ->
    io:format("Given list is empty.~n");
% Simple adding B to the end of A using ++
combine(A, B) ->
    A ++ B.

% Will give errors if the given list is not a list or is empty
reverse(A) when not is_list(A) ->
    throw({error, is_not_list});
reverse([]) ->
    io:format("Given list is empty.~n");
% Sends to secondary implementation with accumulator
reverse(A) ->
    reverse(A, []).

% When it gets through the list, it returns the accumulated result
reverse([], Acc) ->
    Acc;
% Uses head and tail recursion to reverse the order of the list
reverse([H | T], Acc) ->
    reverse(T, [H | Acc]).

% Will give errors if the given list is not a list or is empty
palindrome(A) when not is_list(A) ->
    throw({error, is_not_list});
palindrome([]) ->
    io:format("Given list is empty.~n");
% Uses the previous reverse function to check if the given list is equal to its reverse form, therefore a palindrome
palindrome(A) ->
    A == reverse(A).