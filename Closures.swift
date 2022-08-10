//
//  Closures.swift
//  
//
//  Created by Mayank on 10/08/22.
//

import Foundation
import UIKit
import Darwin


// A Simple Closure
let closure1st = {
    print("Simple closure")
}
closure1st()

// Closure With Single parameter
let closureWithParameter = { (str: String) in

    print("Hello! \(str)")
}
closureWithParameter("Mayank")

// Closure with Parameters and return type
let closureWithParametersAndReturnType = { (num1:Int, num2:Int) -> (Int) in

    return num1 + num2

}
print(closureWithParametersAndReturnType(1,6))


// Closure as a parameter of function
func functionWithClosure(greet: () -> ()) {

}
functionWithClosure {

}



// Capture list of the closure creates the copy of name
var name = "Mayank"
let closureTesting = { [name] in // in keyword is important to copy [name]

    print("I love \(name)")
}
name = "Neema" // It will not update name variable since [name] already captured.
closureTesting()



// Function that returns a closure

func execute() -> (Int) -> Int {
    var input = 0 // Will be called just once while calling a = op(5)
    
    return { output in
        input = input + output
        return input
    }
}
let op = execute()
let a = op(5)
let b = op(10)
let c = op(15)

print(c) // Output will 30 because closures are reference types.

