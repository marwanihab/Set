    //
    //  Set.swift
    //  SetGame
    //
    //  Created by Marwan Ihab on 10/20/18.
    //  Copyright © 2018 Marwan Ihab. All rights reserved.
    //

    import Foundation

    class Set {
        
        var Cards = [Card]()
        var currentCards = [Card]()
        var selectedCards = [Card]()
        var matchedCards = [Card]()
        var notMatchFound = false;
        var score=0
        
        func selectCard(Card card:Card){
            
            if selectedCards.count != 3 {
            if !selectedCards.contains(card)  {
                selectedCards += [card]
                
            }
            else{
                if let cardIndex = selectedCards.index(of: card){
                    selectedCards.remove(at: cardIndex)
                    
                }
                
            
            }
            
                
            }
            
            if selectedCards.count == 3{
                
                if notMatchFound == true{
                    selectedCards.removeAll()
                    selectedCards += [card]
                    notMatchFound=false
                    score=score-1
                }
                else{
                
                let firstCard = selectedCards[0]
                let secondCard = selectedCards[1]
                let thirdCard = selectedCards[2]
                
                
                if (firstCard.symbol == secondCard.symbol) || (firstCard.symbol == thirdCard.symbol) {
                    if (firstCard.symbol == secondCard.symbol){
                        if !(firstCard.symbol == thirdCard.symbol){
                            notMatchFound = true
                        }
                    }
                    else{ if (firstCard.symbol == thirdCard.symbol){
                        if !(firstCard.symbol == secondCard.symbol){
                            notMatchFound = true
                        }
                        }
                    }
                }
                
                if (firstCard.shading == secondCard.shading) || (firstCard.shading == thirdCard.shading) {
                    if (firstCard.shading == secondCard.shading){
                        if !(firstCard.shading == thirdCard.shading){
                            notMatchFound = true
                        }
                    }
                    else{ if (firstCard.shading == thirdCard.shading){
                        if !(firstCard.shading == secondCard.shading){
                            notMatchFound = true
                        }
                        }
                        
                    }
                }
                
                if (firstCard.color == secondCard.color) || (firstCard.color == thirdCard.color) {
                    if (firstCard.color == secondCard.color){
                        if !(firstCard.color == thirdCard.color){
                            notMatchFound = true
                        }
                    }
                    else{ if (firstCard.color == thirdCard.color){
                        if !(firstCard.color == secondCard.color){
                            notMatchFound = true
                        }
                        }
                        
                    }
                }
                if (firstCard.number == secondCard.number) || (firstCard.number == thirdCard.number) {
                    if (firstCard.number == secondCard.number){
                        if !(firstCard.number == thirdCard.number){
                            notMatchFound = true
                        }
                    }
                    else{ if (firstCard.number == thirdCard.number){
                        if !(firstCard.number == secondCard.number){
                            notMatchFound = true
                        }
                        }
                    }
                }
                if notMatchFound == false{
                    matchedCards += selectedCards
                  
                    
                }
               
                
                
            }
            }
            
        }
        
        func dealCards(){
            
            if selectedCards.count == 0{
                
                if currentCards.count<=24,Cards.count>3{
                    let card1 = Cards.remove(at: 0)
                    let card2 = Cards.remove(at: 1)
                    let card3 = Cards.remove(at: 2)
                    
                    currentCards.append(card1)
                    currentCards.append(card2)
                    currentCards.append(card3)
                    
                }
                else{
                    print("more than 24")
                }
                
                
            }else{
                if selectedCards.count == 3{
                    
                if notMatchFound == false{
                    
                     score = score+1
                    
                    let index1 = currentCards.index(of: selectedCards[0])!
                    let index2 = currentCards.index(of: selectedCards[1])!
                    let index3 = currentCards.index(of: selectedCards[2])!
                    
                    
                    let card1 = Cards.remove(at: 0)
                    let card2 = Cards.remove(at: 1)
                    let card3 = Cards.remove(at: 2)
                    
                    currentCards.insert(card1, at: index1)
                    currentCards.remove(at: index1+1)
                    currentCards.insert(card2, at: index2)
                    currentCards.remove(at: index2+1)
                    currentCards.insert(card3, at: index3)
                    currentCards.remove(at: index3+1)
                    
                    selectedCards.removeAll()
                    
                    
                }
                
                }
            }
            
            
            
            
            
        }
        
        
        
        init() {
            
            
            let symbols = ["triangle","circle","square"]
            let colors = ["green","red","purple"]
            let shadings = ["filled","stripped","open"]
            let numbers = [1,2,3]
            var index = 0

                for symbol in symbols {
                  
                    for color in colors{
                       
                        
                        for shading in shadings{
                            
                            for number  in numbers{
                               
                                let  newCard = Card(symbol:symbol,number:number,color:color,shading:shading)
                               
                                        self.Cards += [newCard]
                                        index=index+1
                                        
                            
                            }
                        }
                    }
                }
            
            
              self.Cards.shuffle()
            
            
            for _ in 0..<12{
                
                let randomNumber = Int(arc4random_uniform(UInt32(Cards.count)))
                let cardAdded = self.Cards.remove(at: randomNumber)
                self.currentCards.append(cardAdded)
                
                
                
            }
            
            
            
        }
        
        
    }
    
    extension MutableCollection {
        /// Shuffles the contents of this collection.
        mutating func shuffle() {
            let c = count
            guard c > 1 else { return }
            
            for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
                // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
                let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
                let i = index(firstUnshuffled, offsetBy: d)
                swapAt(firstUnshuffled, i)
            }
        }
    }
    
    extension Sequence {
        /// Returns an array with the contents of this sequence, shuffled.
        func shuffled() -> [Element] {
            var result = Array(self)
            result.shuffle()
            return result
        }
    }
