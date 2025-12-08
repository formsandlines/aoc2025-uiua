# Advent of Code, Day 3

In ← &fras "input/day_03.txt"

Ex ← (
  $ 987654321111111
  $ 811111111111119
  $ 234234234234278
  $ 818181911112111
)

Parse ← ⊜≡⋕⊸≠@\n

┌─╴Part₁
  MaxPair ← (
    ⊸⍖          # get descending sort indices
    ⤙(⊂1≥)⊸⊃⊢↘₁ # find higher indices than first
    ↙₂˜⊂⊓⊢▽     # join first with either higher or next index
    ⊏⍆          # sort ascending and select from array
  )
  F ← /+⋕≡/◇⊂°⋕ ≡MaxPair Parse

  ⍤⤙=357 F Ex   # passed
  ⍤⤙=16842 F In # passed

  # Observations:

  # - For it to be the largest possible joltage, the first digit should be higher, since it is the 10’s part.
  # - If this is not possible, the second highest digit should be chosen, while the second digit is the highest one.

  # My approach:

  # Since the position of a digit is its index and I need to know which one is the highest, `⍖` (fall) gives me both informations at once, which can then be combined to solve the puzzle.
└─╴

┌─╴Part₂
└─╴
