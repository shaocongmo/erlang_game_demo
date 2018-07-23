-module(common_tool).

%% ====================================================================
%% Include files  
%% ====================================================================


%% ====================================================================
%% API functions
%% ====================================================================
-export([rand/2]).

rand(Same, Same) -> 
    Same; 
rand(Min, Max) ->
    case get(dic_rand_seed) of
        undefined ->
            RandSeed = os:timestamp(),
            rand:seed(exs1024s, RandSeed),
            put(dic_rand_seed, RandSeed);
        _ -> 
            skip
    end,
    M = Min - 1,
    rand:uniform(Max - M) + M.

%% ====================================================================
%% Internal functions
%% ====================================================================


    