R←{⍵/⊂1  0}
U←{⍵/⊂0  1}
L←{⍵/⊂¯1 0}
D←{⍵/⊂0 ¯1}
dH←⍉{(0.5×≢⍵) 2⍴⍵}∊⍎¨⊃⎕NGET'input'1
HT←↓⍉(⊢⍪⊢)↑{(⍺+⊃⍵),⍵}/(⌽0 0,dH)
move←{{⍵[3 4 1 2]}¨⊃{(⊂⍺[1 2],(⊃⍵)[1 2+2×3>+/2*⍨⍺[1 2]-(⊃⍵)[3 4]]),⍵}/⌽(⊂@1)⌽⍵}
⍝pos←{⊃{(⊂⍺[1 2],(⊃⍵)[1 2+2×3>+/2*⍨⍺[1 2]-(⊃⍵)[3 4]]),⍵}/⌽(⊂@1)⌽⍵}HT
places←∪{⍵[1 2]}¨
⎕←≢places move HT

move←{{⍵[3 4 1 2]}¨⊃{Tk←(⊃⍵)[3 4]⋄Hkp←⍺[1 2]⋄d←3<+/2*⍨Hkp-Tk⋄(⊂Hkp,(Tk+d××Hkp-Tk)),⍵}/⌽(⊂@1)⌽⍵}

⎕←≢places move⍣9⊢ HT