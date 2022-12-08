data←↑⍎¨¨⊃⎕NGET'input'1
max←(⌈⍀data)(⌈\data)(⊖⌈⍀⊖data)(⌽⌈\⌽data)
vis←{1↓¯1↓¯1↓[2]2</⍵}
v←(vis 2⊃max)(⍉vis⍉1⊃max)(⌽vis ⌽4⊃max)(⍉⌽vis⌽⍉3⊃max)
⎕←(+/2×¯1+⍴data)++/,↑∨/v

dist←{m←,1↑t←⍺↓(10@(⊃⍴⍵))⍵⋄v←↑m∘>¨↓1↓t⋄1↓¯1↓1+{⍺+⍺×⍵}⌿v}
sscore←{↑dist∘⍵¨⍳¯2+⊃⍴⍵}
s←(sscore data)(⊖sscore⊖data)(⍉sscore⍉data)(⍉⊖sscore⊖⍉data)
⎕←⌈/,↑×/s