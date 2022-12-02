: A ( -- c ) \ Opponent rock
	[char] R ;
: B ( -- c ) \ Opponent paper
	[char] P ;
: C ( -- c ) \ Opponent scissors
	[char] S ;
: X ( u c -- u ) \ Me rock
	CASE
		[char] R OF 3 ENDOF
		[char] P OF 0 ENDOF
		[char] S OF 6 ENDOF
	ENDCASE
	1 + + ;	
: Y ( u c -- u ) \ Me paper
	CASE
		[char] R OF 6 ENDOF
		[char] P OF 3 ENDOF
		[char] S OF 0 ENDOF
	ENDCASE
	2 + + ;	
: Z ( u c -- u ) \ Me scissors
	CASE
		[char] R OF 0 ENDOF
		[char] P OF 6 ENDOF
		[char] S OF 3 ENDOF
	ENDCASE
	3 + + ;	
0 s" input" included \ Initialize accumulator and count
: X ( u c -- u ) \ Me lose
	CASE
		[char] R OF 3 ENDOF
		[char] P OF 1 ENDOF
		[char] S OF 2 ENDOF
	ENDCASE
	0 + + ;	
: Y ( u c -- u ) \ Me draw
	CASE
		[char] R OF 1 ENDOF
		[char] P OF 2 ENDOF
		[char] S OF 3 ENDOF
	ENDCASE
	3 + + ;	
: Z ( u c -- u ) \ Me win
	CASE
		[char] R OF 2 ENDOF
		[char] P OF 3 ENDOF
		[char] S OF 1 ENDOF
	ENDCASE
	6 + + ;	
0 s" input" included \ Initialize accumulator and count
cr swap ." A: " . cr ." B: " . cr
bye
\ TODO factor out the case statements...
