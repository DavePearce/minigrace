// Loop invariant dialect
import "StandardPrelude" as StandardPrelude
inherits StandardPrelude.new

def InvariantFailure = Error.refine "InvariantFailure"

method for(it)invariant(inv)do(blk) {
    for (it) do {i->
        if (! inv.apply) then {
            InvariantFailure.raise "Loop invariant not satisfied."
        }
        blk.apply(i)
    }
    if (! inv.apply) then {
        InvariantFailure.raise "Loop invariant not satisfied."
    }
}

method while(c)invariant(inv)do(blk) {
    while (c) do {i->
        if (! inv.apply) then {
            InvariantFailure.raise "Loop invariant not satisfied."
        }
        blk.apply(i)
    }
    if (! inv.apply) then {
        InvariantFailure.raise "Loop invariant not satisfied."
    }
}

// use e.g.:
//  var sum: Number  := 0
//  for (data) invariant { sum >= 0 } do { item : Number ->
//      sum := sum + item
//  }
