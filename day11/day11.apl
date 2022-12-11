⎕IO←0
data←⊃⎕NGET'input'1
p←((×≢)¨⊆⊢)data
p←('([+×])(\d)'⎕R'\1∘\2')∘∊∘{'(',⍵,')'}∘('old'⎕R'⊢')∘('\*'⎕R'×')∘('[\d,*+]|old'⎕S'&')¨¨p
p←↓⍉↑((⍎¨¨)@0 1 3 4 5)↓⍉↑p
items←⊂1⊃¨p
p←⌽{¯1⌽1↓1⌽⍵}¨p
monkeys←≢p
divisible←{~×⍺|⍵}
inspections←{m op t y n←⍺⋄c←m⊃⍵⋄c←op worry c⋄i←t divisible c⋄r←c[⍸~i]({⊂⍺,⊃⍵}@n)c[⍸i]({⊂⍺,⊃⍵}@y)⍵⋄(({⍵+≢⊃m⌷r}@(m+monkeys))((⊂⍬)@m)r)}

worry←{0::⍬⋄⌊3÷⍨⍎⍺,⍕⍵}
⎕←×/2↑{⍵[⍒⍵]}monkeys↓↑{inspections/p,⍵}⍣20⊢↓(monkeys ⍴ 0),⍨↑items

lcm←∧/2∘⊃¨p
worry←{0::⍬⋄lcm|⍎⍺,⍕⍵}
⎕←×/⎕←2↑{⍵[⍒⍵]}monkeys↓↑{inspections/p,⍵}⍣10000⊢↓(monkeys ⍴ 0),⍨↑items
