//
//  Double.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 30/06/24.
//

import Foundation


extension Double {
    /// convert the double to currency into 2 - 6 Fraction Digits
    /// ```
    ///convert 1234.485839988759 to $1,234.48
    ///convert 12.324543534562 to $12.32
    ///
    /// ```
    private var currencyFormatter2:NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "en_US" // <- change the type of currency
        formatter.currencySymbol = "$" // <- change the currency Symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    /// convert the double to currency into 2   Fraction Digits Strings
    /// ```
    ///convert 1234.485839988759 to "$1,234.48"
    ///convert 12.324543534562 to "$12.32"
    ///
    /// ```
    ///
    /// ⚠️ Bear in your mind that all the examples you provide must have writen Unit-testing to make sure everythings is correct
    func asCurrencyWith2Decimals()-> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// convert the double to currency into 2 - 6 Fraction Digits
    /// ```
    ///convert 1234.485839988759 to $1,234.485839
    ///convert 12.324543534562 to $12.324543
    ///
    /// ```
    private var currencyFormatter6:NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "en_US" // <- change the type of currency
        formatter.currencySymbol = "$" // <- change the currency Symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    /// convert the double to currency into 2 - 6 Fraction Digits Strings
    /// ```
    ///convert 1234.485839988759 to "$1,234.485839"
    ///convert 12.324543534562 to "$12.324543"
    ///
    /// ```
    ///
    /// ⚠️ Bear in your mind that all the examples you provide must have writen Unit-testing to make sure everythings is correct
    func asCurrencyWith6Decimals()-> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    /// convert the double to String representation
    /// ```
    ///convert 1234.485839988759 to "1,234.48"
    ///convert 12.324543534562 to "12.32"
    /// ```
    /// ⚠️ Bear in your mind that all the examples you provide must have writen Unit-testing to make sure everythings is correct
    func asNumberString()-> String {
        return String(format: "%.2f", self)
    }
    func asPercentString()-> String {
        return asNumberString() + " %"
    }
}
