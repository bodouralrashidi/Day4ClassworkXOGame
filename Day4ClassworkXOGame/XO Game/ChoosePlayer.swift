//
//  ChoosePlayer.swift
//  Day4ClassworkXOGame
//
//  Created by Bodour Alrashidi on 5/8/20.
//  Copyright © 2020 Bodour Alrashidi. All rights reserved.
//

import SwiftUI

struct ChoosePlayer: View {
    var body: some View {
        
           
                VStack(spacing : 50){
                Text("Who Starts first ?")
                   NavigationView{
                HStack(spacing : 20){
                    Text("X").modifier(ButtonModifer())
                       // .onTapGesture
        // {NavigationLink(destination: XOGame( currentplayer: "O"))
                    }
    // NavigationLink(                   }
                Text("O").modifier(ButtonModifer())
                                       .onTapGesture
                                       {Text("")}
                
                }}
        }
    }


struct ChoosePlayer_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePlayer()
    }
}
struct ButtonModifer : ViewModifier {
    func body(content: Content) -> some View {
        content
        .foregroundColor(.white)
                   .font(.system(size: 50, weight: .bold, design: .rounded))
                   .frame(width: 100, height: 100)
                   .background(Color.blue)
        
    }
}
