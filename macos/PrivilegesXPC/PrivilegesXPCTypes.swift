//
//  PrivilegesXPCTypes.swift
//  PrivilegesXPC
//
//  Created by Sebastian Döll on 17.11.23.
//

// A sample codable type that contains two numbers to be added together.
struct CalculationRequest: Codable {
    let firstNumber: Int
    let secondNumber: Int
}

// A sample codable type that contains the result of a calculation.
struct CalculationResponse: Codable {
    let result: Int
}

// A sample codable type that contains two numbers to be added together.
struct ExampleRequest: Codable {
    let firstNumber: Int
    let secondNumber: Int
}

// A sample codable type that contains the result of a calculation.
struct ExampleReponse: Codable {
    let result: Int
}
