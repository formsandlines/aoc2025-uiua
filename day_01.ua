# Advent of Code, Day 1

In ← &fras "input/day_01.txt"

Ex ← (
  $ L68
  $ L30
  $ R48
  $ L5
  $ R60
  $ L55
  $ L1
  $ L99
  $ R14
  $ L82
)
Init ← 50

Parse ← (
  ⊜(⊃⊢(⋕↘₁))¬⊸=@\n # parse dir. & dist.
  ⨬¯∘⊛             # apply dir. to dist. as sign
)

┌─╴Part₁
  F ← (
    Parse
    \(◿₁₀₀+)⊂Init # calculate dial positions
    ⧻▽⊸=0         # count 0s
  )
  ⍤⤙=3 F Ex    # passed
  ⍤⤙=1132 F In # passed
└─╴

┌─╴Part₂
  F ← (
    Parse
    ⟜(\(◿₁₀₀+)⊂Init) # like part 1
    ⌵⟜(◿₁₀₀×±)⌝↘¯1   # normalize starting positions
    ⧻˙▽⌊÷₁₀₀+        # add distance, divide to count 0s
  )
  ⍤⤙≍6 F Ex    # passed
  ⍤⤙≍6623 F In # passed
└─╴
