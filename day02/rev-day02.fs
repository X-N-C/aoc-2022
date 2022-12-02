: rps ( u u-opp ur up us -- u )
	3 pick pick >r 2drop 2drop r> + ;
2 constant A
1 constant B
0 constant C
: X ( u u-opp -- u ) 4 1 7 rps ;
: Y ( u u-opp -- u ) 8 5 2 rps ;
: Z ( u u-opp -- u ) 3 9 6 rps ;
0 s" input" included
: X ( u u-opp -- u ) 3 1 2 rps ;
: Y ( u u-opp -- u ) 4 5 6 rps ;
: Z ( u u-opp -- u ) 8 9 7 rps ;
0 s" input" included
cr .s cr
bye
