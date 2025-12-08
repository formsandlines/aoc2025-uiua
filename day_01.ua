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
  ⊜(⊃⊢(⋕↘₁))⊸≠@\n # parse dir. & dist.
  ⨬¯∘⊛            # apply dir. to dist. as sign
)

┌─╴Part₁
  F ← (
    Parse
    \(◿₁₀₀+)⊂Init # calculate dial positions
    /+=0          # count 0s
  )
  ⍤⤙=3 F Ex    # passed
  ⍤⤙=1132 F In # passed
└─╴

┌─╴Part₂
  F ← (
    Parse
    ⟜(\(◿₁₀₀+)⊂Init) # like part 1
    ⌵⟜(◿₁₀₀×±)⌝↘¯1   # normalize starting positions
    /+⌊÷₁₀₀+         # add distance, divide to count 0s
  )
  ⍤⤙≍6 F Ex    # passed
  ⍤⤙≍6623 F In # passed

  # My approach:

  # Looking at the starting positions I calculated in part 1, I noticed that adding their rotations would give me the “normalized” rotations that start from 0, which I just have to divide by 100 to get the number of 0 crossings.
  # However, I had to account for two special cases:
  # - If the starting position is >= 100, modulo 100 should set it back.
  # - If the rotation is negative (leftwards), I can treat it like a positive distance by adding the complementary starting position instead, which I get by taking the modulo of its negative. Of course, the added rotation has to be positive.
└─╴

# Things I noticed:

# - output comments `##…` and the args `?` function are really helpful to get insights into interim results
# - I like breaking up Uiua code into multiple short lines that each solve some functionally distinct part of my solution and describe each line in a comment
# - when a part of my code solves a very different problem, it helps moving it to a separate function
# - naming constants avoids confusion
# - I like using uiua.org/pad for some interactive sketches before writing a clean solution in my editor
# - `°⊂` puts head and tail of an array on the stack, which could have been used here to split direction and distance
# - could use predicate matches more intelligently for switches instead of using `⨬`
# - the “wrench” `-⊸¬` turns boolean list into list of -1/1:
# - `°×` does the same as `⊙⌵⊸±`
# - `◿100\+` would have been shorter & faster than `\(◿₁₀₀+)`
