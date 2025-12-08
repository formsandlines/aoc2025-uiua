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
  D ← 12
  MaxSeq ← (
    ⊸⍖        # get descending sort indices
    ⊸(˜--₁⊸⧻) # remaining digits for each index
    ⇌⇡D       # remaining digits for each joltage position
    ≡(□▽)⊙¤⊞≥ # table positions × possible indices
    \⍚(▽⊸>⊢)  # filter each position by prev. chosen index
    ⊏≡◇⊢      # select digits by chosen indices
  )
  F ← /+⋕≡/◇⊂°⋕ ≡MaxSeq Parse

  ⍤⤙=3121910778619 F Ex   # passed
  ⍤⤙=167523425665348 F In # passed

  # Observations:

  # - Generalizing from part 1, digits of a lower (index) joltage position should always (if possible) be greater than the higher ones.
  # - If not possible, the next greatest possible digit should be chosen, which may be greater than a previous lower position.
  # - A digit of index i is possible for the j’th position of the joltage output, if i >= the previous chosen index and there are enough digits left to fill the n-j remaining joltage positions.

  # My approach:

  # As with part 1, the sort indices were my starting point.
  # To make sure the selected digits fit with the remaining positions of the number, I calculated the digits that remain for each sort index as well as the remaining digits from each position in the number that is to be assembled.
  # This allowed me to create a table that shows what indices are possible to select for each position.
  # With a scan, I could then choose the first index (= highest digit) for each position and filter out greater or equal indices for the next position, from which again the first index is chosen.
  # This procedure follows my observations above. I was nervous if it would have to be iterated in case the last positions could not be filled, which luckily was not the case.
└─╴
