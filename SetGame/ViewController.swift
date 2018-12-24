//
//  ViewController.swift
//  SetGame
//
//  Created by Marwan Ihab on 10/26/18.
//  Copyright © 2018 Marwan Ihab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private  var game = Set() ;
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var dealButton: UIButton!
        
    
    @IBOutlet var cardsButton: [UIButton]!
    
    
    
    @IBAction func selectCard(_ sender: UIButton) {
        
        let cardIndex = cardsButton.index(of: sender)!
        if cardIndex < game.currentCards.count{
            let card = game.currentCards[cardIndex]
            game.selectCard(Card: card)
            updateViewFromModel()
            
            
        }
       
        
       
        
        
        
    }


    @IBAction func DealCards(_ sender: UIButton) {
          game.dealCards()
          updateViewFromModel()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = Set()
        dealButton.setTitle("Deal 3 More Cars", for: UIControlState.normal )
        dealButton.backgroundColor=#colorLiteral(red: 0.4440522111, green: 0.3383156099, blue: 1, alpha: 1)
        
        updateViewFromModel()
    }
    
    
    func updateViewFromModel()  {
        
        for index in cardsButton.indices{
            cardsButton[index].setTitle("", for: UIControlState.normal)
             cardsButton[index].setAttributedTitle(nil, for: UIControlState.normal)
            cardsButton[index].backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        
        for index in game.currentCards.indices {
            
            let tempCard = game.currentCards[index]
            let symbol = tempCard.symbol!
            let color = tempCard.color!
            let number = tempCard.number!
            let shading = tempCard.shading!
            
            var stringUsed = ""
            var colorUsed:UIColor=#colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 0)
            
            if color == "green"{
                colorUsed=#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            }
            
            if color == "red"{
                colorUsed=#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
            }
            
            if color == "purple"{
                colorUsed=#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
            }
            
            
            
            for _ in 0..<number{
            if symbol == "triangle"{
                stringUsed=stringUsed+"▲"
            }
                if symbol == "circle"{
                    stringUsed=stringUsed+"●"
                }
                if symbol == "square"{
                    stringUsed=stringUsed+"■"
                }
            
            
            }
            
            var  attributes: [NSAttributedStringKey: Any]=[:]
            
            if shading == "filled"{
                
                
                 attributes = [
                    .strokeWidth: -8,
                    .strokeColor: colorUsed,
                    .foregroundColor: colorUsed.withAlphaComponent(1.0)                ]
           
            }
            
            if shading == "stripped"{
                
                
                attributes = [
                    .strokeWidth: -8,
                    .strokeColor: colorUsed,
                    .foregroundColor: colorUsed.withAlphaComponent(0.35)                ]
                
            }
            
            if shading == "open"{
                
                
                attributes = [
                    .strokeWidth: 8,
                    .strokeColor: colorUsed,
                                  ]
                
            }
            
            
             let attributedString = NSAttributedString(string: stringUsed, attributes: attributes)
            
             cardsButton[index].setAttributedTitle(attributedString, for: UIControlState.normal)
             cardsButton[index].backgroundColor=#colorLiteral(red: 1, green: 0.8804999712, blue: 0.9814960204, alpha: 1)
             cardsButton[index].layer.cornerRadius = 8.0
             
            
            
          
            
            if game.selectedCards.contains(tempCard){
                cardsButton[index].layer.borderWidth = 3.0
                cardsButton[index].layer.borderColor = UIColor.blue.cgColor

            
            }
            else{
                
                cardsButton[index].layer.borderWidth = 0
                
            }
            
            if game.matchedCards.contains(tempCard){
                    cardsButton[index].layer.borderWidth = 7.0
                    cardsButton[index].layer.borderColor = UIColor.green.cgColor
                    
                    print(game.matchedCards)
                    
                }
            
        
        }
        if game.currentCards.count == 24 {
            dealButton.isEnabled=false
        }
        
        score.text="Score:\(game.score)"
        score.backgroundColor=#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        
        
        
        
        
        
    }
}

