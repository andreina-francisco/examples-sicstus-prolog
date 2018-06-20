% Copyright 2018 Maria Andreina FRANCISCO RODRIGUEZ (andreina@comp.nus.edu.sg)
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
% http ://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%
%
% Description:  An implementation of consequtive_ones(Days, AtMost) constraint
% as described in: 
% https://stackoverflow.com/questions/17770356/how-to-use-clpfdautomaton-to-restrict-counter-value-in-sicstus-prolog.
%
% Authors: Maria Andreina FRANCISCO RODRIGUEZ
% Version: 1.0
% Last Revision: 20th June 2018
%
% Instructions: Days is a list of 0/1 variables, AtMost is the maximum number of
% consequtive 1's allowed in the sequence Days.
%

:- use_module(library(clpfd)).

consecutive_ones(Days, AtMost) :-
    automaton(Days, _, Days,
        [source(q),sink(q)],
        [
         arc(q, 0, q, [0]  ),
         arc(q, 1, q, (C #< AtMost -> [C+1]))
        ],
        [C],
        [0],
        [_]
    ).

