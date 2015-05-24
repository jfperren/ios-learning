// Playground - noun: a place where people can play

import UIKit

// Protocol (Equivalent to Interfaces)

protocol Speaker{
    func speak()
}

// Classes implementing a protocol

class Vicki: Speaker {
    func speak() {
        println("Hello, I am Vicki!")
    }
}

class Animal {
}
class Dog : Animal, Speaker {
    func speak() {
        println("Woof!")
    }
}

let vicki = Vicki();
let dog = Dog();

vicki.speak();
dog.speak();

// Optional functions

import Foundation

// somehow @objc is required, so need to import Foundation
@objc protocol Car {
    func move()
    optional func honk()
}

class Volvo : Car {
    func move() {
        println("Vroum")
    }
    
    func honk() {
        println("Buuuump")
    }
}

class Peugeot : Car {
    func move() {
        println("Brrrrrr")
    }
    
    func crash() {
        println("Kaboum")
    }
}

// Optional calls (if know it should be here)

var car:Car = Volvo()
car.honk!();

// Optional chaining -> returns nil if method not implemented

car = Peugeot();
car.honk?();

// Casting

//car.crash() <--- ERROR
(car as Peugeot).crash()

// Delegates (= Class implementing a protocol)

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim:DateSimulator, a: Speaker, b:Speaker)
}

class LoggingDateSimulatorDelegate : DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker) {
        println("Date started!")
    }
    func dateSimulatorDidEnd(sim:DateSimulator, a: Speaker, b: Speaker)  {
        println("Date ended!")
    }
}

class DateSimulator {

    let a,b :Speaker
    var delegate:DateSimulatorDelegate?

    init(a:Speaker, b:Speaker) {
        self.a = a
        self.b = b
    }
    
    func simulate(){
        delegate?.dateSimulatorDidStart(self, a:a, b: b)
        a.speak()
        b.speak()
        delegate?.dateSimulatorDidEnd(self, a: a, b: b)
    }
}

let sim = DateSimulator(a:dog, b:vicki);
let delegate = LoggingDateSimulatorDelegate();

// Without delegate
sim.simulate();

sim.delegate = delegate;

// With delegate
sim.simulate();