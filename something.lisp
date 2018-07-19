
;;;;instruction set should be:
;;;; -orthogonal
;;;; -support self-modification
;;;; -smaller is better all else being equal
;;;; -support multithreading
;;;; -support garbage collection
;;;; -stackless
;;;; -have no preference for "nil"

;;;;on trying to only allow "move" to dereference cars and set cars:
;;;;the evaluator must dereference the function code itself and
;;;;store the result somewhere. So why not store the result in the
;;;;code itself? this fits the theme of self-modification. and allow instructions
;;;;to dereference cars since the evaluator was going to do so anyway.

;;;;in normal lisp:
;;;(a b c d) -> (a . (b . (c . (d . nil))))
;;;;in this thing:
;;;;(a b c d) -> (a . (b . (c . (d . ???))))
;;;;or????: lists are circular
;;;;(a b c d) -> #0=(a . (b . (c . (d . #0#))))

;;;;??? means "don't care"

;;;;on cons cells:
;;;;references to cons cells have a "direction".
;;;;the reference is flipped in place when "flip" executes.
;;;;you cannot tell whether or not a reference is flipped or not, it is relative.
;;;;syntax? <relative-front relative-back} {relative-back relative-front> 

(cons (se1) (se2) next)

;;;;if arg1 and arg2 are the same reference and not flipped relative to each
;;;;other, execute next-same. otherwise execute next-different.
(test (arg1) (arg2) next-same next-different)
(move (dest) (src) next)

;;;;flip a value in-place.
(flip (val) next)

(flip (<} ) ???) -> (flip ({>) ???)

;;;;on the necessity of "fork":
;;;;each instruction could potentially trigger more
;;;;than one "next". but that would make it unorthogonal?
(fork (next1 next2))

;;;;on the necessity of "halt":
;;;;an evaluator could just jump to a loop that does nothing forever
;;;;relative to the other evaluators.
(halt)


;;;;could this lisp run in a limited environment? like dna?
