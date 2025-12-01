In ← &fras "input/day_01.txt"

Ex ←
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

# Day 1, part 1
F ← (
  ⊜(⊃⊢(⋕↘₁)) ¬⊸⌕ @\n # parse dir. & dist.
  ⨬¯∘⊛               # apply dir. to dist. as sign
  \(◿₁₀₀+) ⊂50       # calculate dial positions
  ⧻▽⊸=0              # count 0s
)
⍤⤙=3 F Ex    # passed
⍤⤙=1132 F In # passed
