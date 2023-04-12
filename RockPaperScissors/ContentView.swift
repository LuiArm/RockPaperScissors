//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by luis armendariz on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    let gameChoices = ["🖐", "✌️", "✊"]
   
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
