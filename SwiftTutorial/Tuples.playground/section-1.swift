// Playground - noun: a place where people can play

import UIKit

// Unnamed tuples

let unnamedTuple = (4.00, 25.19)

unnamedTuple.0
unnamedTuple.1

let (one, two) = unnamedTuple
one
two

// Named tuples

let namedTuple = (one:4.00, two:25.19)
namedTuple.one
namedTuple.two

let namedTupleExplicit:(one:Double, two:Double) = (4.00, 25.19)

// Functions

func functionThatReturnsATuple() -> (one:Double, two:Double) {
    return (1, 2)
}

functionThatReturnsATuple()
functionThatReturnsATuple().one
functionThatReturnsATuple().1 // = two !

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        // Compiler error if short form
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}



