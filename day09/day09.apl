R←⍴∘ 1J0
U←⍴∘ 0J1
L←⍴∘¯1J0
D←⍴∘0J¯1
dH←0,∊⍎¨⊃⎕NGET'input'1
H←⌽+\dH
far←{1.5<|⍵}
dir←{+/(¯9 ¯11)∘○×(9 11)∘○⍵}
tail←{↑{⍵,⍨(⊃⍵)+(far×dir)⍺-⊃⍵}/⍵}

⎕←≢∪tail H
⎕←≢∪tail⍣9⊢H