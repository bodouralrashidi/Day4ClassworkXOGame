//
//  XOGame.swift
//  Day4ClassworkXOGame
//
//  Created by Bodour Alrashidi on 5/8/20.
//  Copyright © 2020 Bodour Alrashidi. All rights reserved.
//

import SwiftUI
struct ButtonField {
    var text :String
    var enable : Bool
    
    
}
struct XOGame: View {
    @State var fields : [[ButtonField]] = .init(repeating: .init(repeating: ButtonField(text: "", enable: true), count: 3), count: 3)
    @State var currentplayer = "X"
    @State var winner = ""
    @State var counter = 0
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
            
                VStack(spacing:15){
            
            Text("XO Game")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.yellow)
            Text(winner)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.red)
            Text("\(currentplayer)'s Turn  ").font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            
            Grid(fields: $fields, currentplayer: $currentplayer, counter: $counter, winner: $winner)
            if winner != ""{
            Button(action: {
                //restarts game
                self.restartgame()
                
                
            }) {
                Text("Restart game")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                
                
                }}
            
            }}
    }
   
    
    func restartgame(){
        fields  = .init(repeating: .init(repeating: ButtonField(text: "", enable: true), count: 3), count: 3)
        currentplayer = "X"
        winner = ""
        counter = 0
    }
    
    
}

struct XOGame_Previews: PreviewProvider {
    static var previews: some View {
        XOGame()
    }
}

struct Grid: View {
    @Binding var fields : [[ButtonField]]
    @Binding var currentplayer :String
    @Binding var counter : Int
    @Binding var winner : String
    var body: some View {
        
        ForEach(0..<3){ r in
            HStack(spacing: 15){
                ForEach(0..<3){ c in
                    ButtonLayout(fields: self.$fields, currentplayer: self.$currentplayer, counter: self.$counter, winner: self.$winner, r: r, c: c)}}}
        
        
    
    }
    
}

struct ButtonLayout: View {
    @Binding var fields : [[ButtonField]]
       @Binding var currentplayer :String
       @Binding var counter : Int
       @Binding var winner : String
      var r : Int
   var c : Int
    var body: some View {
        Button(action: {
            //when tapping chnage to x or o
            if self.fields[self.r][self.c].enable
            {
                
                self.fields[self.r][self.c].text = self.currentplayer
                self.currentplayer = self.currentplayer == "X" ? "O":"X"
                self.fields[self.r][self.c].enable = false
                self.counter +=  1
                self.checkWinner()
                
            }
        })
        {Text(self.fields[r][c].text)
            .foregroundColor(.white)
            .font(.system(size: 50, weight: .bold, design: .rounded))
            .frame(width: 110, height: 110)
            .background(Color.yellow.opacity(0.5))
        //    .clipShape(Circle())
          .cornerRadius(40)
           
            
        }
    }
    func checkWinner ()
    {
        func checkWinner(player : String)
       {
           let r1 = fields [0][0].text == player && fields [0][1].text == player && fields [0][2].text == player
           let r2 = fields [1][0].text == player && fields [1][1].text == player && fields [1][2].text == player
           let r3 = fields [2][0].text == player && fields [2][1].text == player && fields [2][2].text == player
           
           let c1 = fields [0][0].text == player && fields [1][0].text == player && fields [2][0].text == player
           let c2 = fields [0][1].text == player && fields [1][1].text == player && fields [2][1].text == player
           let c3 = fields [0][2].text == player && fields [1][2].text == player && fields [2][2].text == player
           
           let d1 = fields [0][0].text == player && fields [1][1].text == player && fields [2][2].text == player
           let d2 = fields [0][2].text == player && fields [1][1].text == player && fields [2][0].text == player
       
           if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2
           {
               winner = "\(player ) wins"
           }
           else if counter == 9
           {
               winner = "DRAW"
           }
           }
           checkWinner(player: "X")
           checkWinner(player: "O")
           
       }
}
