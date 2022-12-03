data←⊃⎕NGET'input' 1⍝Read data as vector of lines
letters←⎕A,⍨¯1⎕C⎕A ⍝All the letters sorted according to priority. ⎕A is A..Z, ⎕C case converts.

A←{(2÷⍨≢⍵)(↑∪⍤∩↓)⍵}¨data⍝Find the halfway point via (2÷⍨≢⍵), then take the unique elements of the intersection of the two halves with (↑∪⍤∩↓). Do this for each line {...}¨.
⎕←+⌿letters⍳↑A⍝Flatten A, then find the indices of the elements in vector letters. Finally sum and then print

B←(1 0 0⍴⍨≢data)⊂data⍝Partition (⊂) with boundaries on every third element. (1 0 0⍴⍨≢data) repeats the vector [1 0 0], providing the boundaries, so it becomes ≢data long.
B←↑∪⍤∩/¨B⍝For each group, perform a reduction, taking the unique elements of the intersection.
⎕←+⌿letters⍳↑B⍝Sum priorities