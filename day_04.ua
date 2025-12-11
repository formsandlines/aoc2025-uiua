# Advent of Code, Day 4

In ← &fras "input/day_04.txt"

Ex ← (
  $ ..@@.@@@@.
  $ @@@.@.@.@@
  $ @@@@@.@.@@
  $ @.@@@@..@.
  $ @@.@@@@.@@
  $ .@@@@@@@.@
  $ .@.@.@.@@@
  $ @.@@@.@@@@
  $ .@@@@@@@@.
  $ @.@.@@@.@.
)

Parse ← ⊜(=@@) ⊸≠@\n

# Count neighbours for each roll on the input matrix.
# NbMat ? RollMat
NbCounts ← (
  ⟜(⊟⊢≡⧻⟜⧻)    # keep grid size
  °⊡           # index matrix
  ¤⊂C₂ A₂      # 8 neighbor offsets
  ⊙¤♭₃˜⊞₋₂(+)  # collect neighbour positions
  ↯⤙⊙◌⊞(/+⬚0⊡) # count neighbours at each pos.
)

┌─╴Part₁
  F ← /+♭×<₄⊸NbCounts Parse

  ⍤⤙=13 F Ex   # passed
  ⍤⤙=1551 F In # passed

  # Observations:
  # TODO

  # My approach:
  # TODO
└─╴

┌─╴Part₂
  # Calc. next roll matrix from previous one and add count of accessible rolls to given N.
  # N RollMat ? N RollMat
  Next ← +⊙(⊙(×¬)⊸(/+♭)⊸×<₄⊸NbCounts)
  # Iteratively generate the next roll matrix while adding accessible roll counts. Return the sum.
  F ← ⊙◌Next∩⊣ ⍢◡Next(¬≍⋅⊙⋅∘) ◡Next 0 Parse

  ⍤⤙=43 F Ex   # passed
  ⍤⤙=9784 F In # passed, bit slow

  # Observations:
  # TODO

  # My approach:
  # TODO
└─╴
