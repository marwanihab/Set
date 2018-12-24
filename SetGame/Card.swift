
//  Card.swift
//  SetGame
//
//  Created by Marwan Ihab on 10/20/18.
//  Copyright © 2018 Marwan Ihab. All rights reserved.
//

import Foundation


//enum Color : CaseIterable{
//   
//    
//    case green, red , purple
//    
//}
//
//enum Shading : CaseIterable{
//    case solid, striped, open
//}
//
//enum Number : CaseIterable{
//    case one , two , three
//}
//
//enum Symbol : CaseIterable{
//    case triangle , circle , square
//}

struct Card : Equatable{
    
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        
        let symbolCheck = (lhs.symbol! == rhs.symbol!)
        let colorCheck = (lhs.color! == rhs.color!)
        let numberCheck = (lhs.number! == rhs.number!)
        let shadingCheck = (lhs.shading! == rhs.shading!)
        
//        print(lhs.symbol!)
//        print(rhs.symbol!)
        
        
        
//        let parameter1 = (symbolCheck == colorCheck)
//        let parameter2 = (numberCheck == shadingCheck)
        
        return (symbolCheck && colorCheck && numberCheck && shadingCheck)
        
             }
    
    
    var symbol:String?
    var number:Int?
    var color:String?
    var shading:String?
    
    
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
   
    
    init(symbol:String, number:Int, color:String , shading:String) {
        
        self.color = color
        self.number = number
        self.shading = shading
        self.symbol = symbol
        self.identifier = Card.getUniqueIdentifier()
        
        
    }
//    mutating func set(Symbol symbol:String, Number number:Int, Color color:String , Shading shading:String)  {
//        self.color = color
//        self.number = number
//        self.shading = shading
//        self.symbol = symbol
//    }
    
}
