# ⍝Comments
## `R←⍴∘ 1J0`
## `U←⍴∘ 0J1`
## `L←⍴∘¯1J0`
## `D←⍴∘0J¯1`

*Binds* the right argument of *reshape* to a complex number. As an example, when the input is parsed, `R 4` creates the array `1 1 1 1` and `D 2` creates `0J¯1 0J¯1`.

---
## `dH←0,∊⍎¨⊃⎕NGET'test'1`
Reads the file as a vector of character arrays (`⊃⎕NGET'test'1`). *Each* inner array is *executed* and the vector is *enlisted* (or flattened). Finally a 0 is prepended, giving how the **head** moves during each transition.

---
## `H←⌽+\dH`
*Plus scan* gets the cumulative sum, then *reverse* so the end of the array is the starting position. Now we have the complete trajectory of the head.

---
## `far←{1.5<|⍵}`
Is 1.5 *less than* the *magnitude* of the argument? I.e., if ⍵ is the difference between two knots, should the follower move?

---
## `dir←{+/(¯9 ¯11)∘○×(9 11)∘○⍵}`
Black magic (a.k.a. *circular function* trickery). Extract the real and imaginary parts (gives a 2-element vector), find the *direction* of each component and then combine to a complex number again. This gives a complex number inside a square, telling us how the knot should move

---
## `tail←{↑{⍵,⍨(⊃⍵)+(far×dir)⍺-⊃⍵}/⍵}`
Perform a *fold* (from left) over ⍵ (a scan might be better but I couldn't get that to work). The *commute* operator (⍨) causes the right side of *catenate* (,) to be the left argument, i.e. the result of each reduction will be a vector of increasing size. Here ⍺ is the **head** position and the *first* element of ⍵ is the **tail** position. The *product* of `far` (yielding 1 or 0 depending on if the tail should move) and `dir` is either zero, causing the tail position to remain unchanged, or the value of `dir` which is the direction the tail should move. The result would be a nested array, so a final *mix* is applied to flatten it.

---
## `⎕←≢∪tail⍣9⊢H`
Apply `tail` to `H` 9 times, i.e. take `tail` to the *power* of 9. Then *output* (i.e. send to the screen) the *tally* of *unique* elements.