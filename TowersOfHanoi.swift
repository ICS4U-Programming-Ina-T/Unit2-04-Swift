//
// TowersOfHanoi.swift
//
// Created by Ina Tolo
// Created on 2022-04-12
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The TowersOfHanoi program implements an application that
// solves the Tower of Hanoi riddle.

// calculates where the disks should be placed in
func hanoi(nOfDisks: Int, startPeg: Int, endPeg: Int) {
    // declaring variables
    let pegNumber: Int = 6

    if nOfDisks == 1 {
        print("Move disk 1 from peg \(startPeg) to peg \(endPeg)")
    } else {
        hanoi(nOfDisks: nOfDisks - 1, startPeg: startPeg, endPeg: pegNumber - startPeg - endPeg)
        print("Move disk \(nOfDisks) from peg \(startPeg) to peg \(endPeg)")
        hanoi(nOfDisks: nOfDisks - 1, startPeg: pegNumber - startPeg - endPeg, endPeg: endPeg)
    }
}

// stores exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("This is not an integer")
}

// declaring variables
let startPegMain: Int = 1
let endPegMain: Int = 3
var nOfDisksInt: Int
var nOfDisksString: String = ""

print("This program functions as the Tower of Hanoi game.")
print()

// gets disk amount from the user
print("How many disks do you want?: ", terminator: "")
nOfDisksString = readLine()!
print()

do {
    nOfDisksInt = Int(nOfDisksString) ?? 0

    if nOfDisksInt != Int(nOfDisksString) {
        try catchString()
    }

    if nOfDisksInt > 0 {
        // function call to calculate moves
        hanoi(nOfDisks: nOfDisksInt, startPeg: startPegMain, endPeg: endPegMain)
    } else {
        print("Please enter a positive integer")
    }

} catch MyError.runtimeError(let errorMessage) {
    print(errorMessage)
}
