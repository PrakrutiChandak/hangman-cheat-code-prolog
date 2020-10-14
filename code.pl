print_freq_from_file(Path) :-
    open( Path, read, Stream ),
    read_file( Stream, Words ),
    calc_freq( Words, Freq ),
    sort_freq( Freq, SortedFreq ),
    print_freq( SortedFreq ).

calc_freq( [], [] ).
calc_freq( [Word|Words], Freq ) :-
    calc_freq( Words, FreqRest ),
    add_word( Word, FreqRest, Freq ).

add_word( Word, [], [(Word,1)] ).
add_word( Word, [(Word,N)|Rest], [(Word,N1)|Rest] ) :-
    N1 is N+1.
add_word( Word, [Term|Rest], [Term|NewRest] ) :-
    add_word( Word, Rest, NewRest ).

print_freq( [] ).
print_freq( [(W,N)|Rest] ) :-
    write( W ), write( ' : ' ), write( N ), nl,
    print_freq( Rest ).