# Advent of Code, Day 2

In ← &fras "input/day_02.txt"

Ex ← "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

# Range of interval between two numbers.
InterRange ← +⇡+₁⤚- # List ? A B

Parse ← ⊜(□InterRange°⊟ ⊜⋕⊸≠@-)×⊸⊃(≠@,)(≠@\n)

┌─╴Part₁
  EqualsHalf ← (
    ⌈÷2⊸⧻⊸°⋕ # count digits
    /≍⬚@-↯⊂2 # split and match halves
    ⨬0∘      # return n on match, else 0
  )
  F ← /+≡◇(/+▽⊸≠0≡EqualsHalf) Parse

  ⍤⤙=1227775554 F Ex  # passed
  ⍤⤙=19574776074 F In # passed, bit slow
└─╴

┌─╴Part₂
  EqualsPart ← (
    °/×⊸⧻⊸°⋕     # find all prime factors of the number’s length
    ≡↻⊙¤°⊏       # transform into a matrix of all their rotations
    ≡(⊂⊃⊢(/×↘₁)) # transform into tuples: [prefix, rest product]
    ◴⊂⊸≡⇌◴       # join with reverse tuples & remove duplicates
    ≡(=1/↧⧈≍↯)⊙¤ # use tuples as shapes to reshape the original number str. and check for equal rows
    ⨬0∘/↥        # return n on match, else 0
  )
  F ← /+≡◇(/+▽⊸≠0≡(⨬0EqualsPart⊸>₉)) Parse

  ⍤⤙=4174379265 F Ex  # passed
  ⍤⤙=25912654282 F In # passed, bit slow
└─╴
