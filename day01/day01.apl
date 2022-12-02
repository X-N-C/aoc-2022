  ⍝ Assumption: No elf has zero calorie food
 ⍝data←,⎕CSV('input' ⍬ 3) ⍝ Read data from CSV as vector (empty lines become zero)
 data←,⎕CSV('test' ⍬ 3) ⍝ Read data from CSV as vector (empty lines become zero)
 data←0(≠⊆⊢)data ⍝ Partition where a zero is found
 total←+/¨data ⍝ Sum each element
 ⎕←maximum←⌈/total ⍝ Maximum of each sum
 ⎕←topthree←+/total[3↑⍒total] ⍝ Sort sums and pick top three