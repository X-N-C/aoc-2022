noop←0
addx←{0,⍵}
dx←∊⍎¨⊃⎕NGET'input'1
during←1,+\(1@1)dx
cycles←¯20+40×⍳6
values←(⊂cycles)⌷during
⎕←cycles+.×values
⎕IO←0
w h←40 6
pixels←{0⌈w⌊¯1 0 1+⍵}¨¯1↓during
x←w|⍳≢dx
⎕←'.#'[h w⍴x∊¨pixels]