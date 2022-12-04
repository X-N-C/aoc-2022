data←⍎¨('[-,]'⎕R' ')⊃⎕NGET'input' 1 ⍝Regex and parse as numbers
⍝ ∨ and ∧ are OR and AND functions
⎕←+/{((⍵[1]≥⍵[3])∧(⍵[2]≤⍵[4]))∨((⍵[1]≤⍵[3])∧(⍵[2]≥⍵[4]))}¨data
⎕←+/{(⍵[1]≤⍵[4])∧(⍵[3]≤⍵[2])}¨data