# ⍝Comments
← assignment

{} function where ⍺ is left argument and ⍵ right argument

`⊃⎕NGET'input' 0` reads file input as a flat vector of characters (`⊃` picks the *first* element, two others are encoding and newline).

---
## `{(⍺-1)+⊃⍸(⍺=≢)¨⍺∪/⍵}`

`⍺∪/⍵` performs an *alpha-wise reduction* using function `∪` to pick the unique elements, selecting ⍺ at a time from ⍵. This gives an array of arrays (depth 2).

`(⍺=≢)¨` on *each* ¨ element in an array, *tally* ≢ the number of elements and check if it *equals to* = alpha.

`⊃⍸` find *where* the element is 1 and pick the *first* one.

`(⍺-1)+` we are looking for when ⍺ unique characters have passed, before this addition we have an offset of ⍺-1.