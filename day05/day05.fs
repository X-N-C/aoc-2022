\ Preprocessing via shell commands (GForth only)
sh csplit input /move/
sh awk '{print $2,$4,$6," crane"}' xx01 > x
\ TODO make this not hardcoded...
create s1 char W c, char M c, char L c, char F c, 56 4 - chars allot
create s2 char B c, char Z c, char V c, char M c, char F c, 56 5 - chars allot
create s3 char H c, char V c, char R c, char S c, char L c, char Q c, 56 6 - chars allot
create s4 char F c, char S c, char V c, char Q c, char P c, char M c, char T c, char J c, 56 8 - chars allot
create s5 char L c, char S c, char W c, 56 3 - chars allot
create s6 char F c, char V c, char P c, char M c, char R c, char J c, char W c, 56 7 - chars allot
create s7 char J c, char Q c, char C c, char P c, char N c, char R c, char F c, 56 7 - chars allot
create s8 char V c, char H c, char P c, char S c, char Z c, char W c, char R c, char B c, 56 8 - chars allot
create s9 char B c, char M c, char J c, char C c, char G c, char H c, char Z c, char W c, 56 8 - chars allot
create crate-count 4 , 5 , 6 , 8 , 3 , 7 , 7 , 8 , 8 ,
create stacks s1 , s2 , s3 , s4 , s5 , s6 , s7 , s8 , s9 ,

: a-stack ( n -- a )
  1- cells stacks + @ ;
: a-#crates ( stack -- n )
  1- cells crate-count + ;
: a-crate ( n -- a )
  dup a-stack swap a-#crates @ -1 + + ;
\ x addr !
: height+ ( n -- )
  a-#crates dup @ 1+ ( a count )
  swap ! ;
: height- ( n -- )
  a-#crates dup @ 1- ( a count )
  swap ! ;
: grab-crate ( n -- c )
  dup a-crate c@ swap ( c n )
  height- ;
: drop-crate ( c n -- )
  dup height+
  a-crate c! ;
: move-crate ( from to -- )
  swap grab-crate swap drop-crate ;
: crane ( n from to -- )
  rot 0 ?DO
    2dup
    move-crate
  LOOP 2drop ;
: crate-tops
  10 1 ?DO
    i a-crate c@ emit
  LOOP ;
s" x" included
crate-tops cr

create s1 char W c, char M c, char L c, char F c, 56 4 - chars allot
create s2 char B c, char Z c, char V c, char M c, char F c, 56 5 - chars allot
create s3 char H c, char V c, char R c, char S c, char L c, char Q c, 56 6 - chars allot
create s4 char F c, char S c, char V c, char Q c, char P c, char M c, char T c, char J c, 56 8 - chars allot
create s5 char L c, char S c, char W c, 56 3 - chars allot
create s6 char F c, char V c, char P c, char M c, char R c, char J c, char W c, 56 7 - chars allot
create s7 char J c, char Q c, char C c, char P c, char N c, char R c, char F c, 56 7 - chars allot
create s8 char V c, char H c, char P c, char S c, char Z c, char W c, char R c, char B c, 56 8 - chars allot
create s9 char B c, char M c, char J c, char C c, char G c, char H c, char Z c, char W c, 56 8 - chars allot
create crate-count 4 , 5 , 6 , 8 , 3 , 7 , 7 , 8 , 8 ,
create stacks s1 , s2 , s3 , s4 , s5 , s6 , s7 , s8 , s9 ,
: a-stack ( n -- a )
  1- cells stacks + @ ;
: a-#crates ( stack -- n )
  1- cells crate-count + ;
: a-crate ( n -- a )
  dup a-stack swap a-#crates @ -1 + + ;
: change-height ( stack change -- )
  >r a-#crates dup @ r> + ( a-stack count )
  swap ! ;
: crane ( n from to -- )
  2dup 2>r ( n from to )
  swap rot dup >r ( to from n )
  2dup 1- negate change-height ( to from n )
  swap rot dup 1 change-height ( n from to )
  a-crate swap a-crate swap ( n a-from a-to )
  rot cmove ( -- )
  r> 2r> ( n from to )
  swap -1 change-height
  swap 1- change-height
  ;
: crate-tops
  10 1 ?DO
    i a-crate c@ emit
  LOOP ;
s" x" included cr
crate-tops cr