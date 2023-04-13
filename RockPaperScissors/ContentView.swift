//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by luis armendariz on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    //Options to choose from
    let gameChoices = ["🖐", "✌️", "✊"]
    // will generate random option dependent on true or false
    @State private var options = Bool.random() ? "WIN" : "LOSE"
    // random choice of number between 0 and 2 in gamechoices array
    @State private var computerChoice = Int.random(in: 0...2)
    // which option user chooses
    @State private var usersAnswer = 0
    //keeps track of score
    @State private var score = 0
    // variable to trigger if result is shown
    @State private var showingResult = false
    // Result printed out
   @State private  var result = ""
    // determine correct answer
    private var correctAnswer: Int {
        return (options == "WIN") ? ( (computerChoice + 1 ) % 3) : ( (computerChoice + 2) % 3)
    }
    
    
   
   
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25){
                Section{
                    Text("Computer will play")
                    Text("\(gameChoices[computerChoice])")
                }
                Spacer()
                
                Section {
                    Text("To \(options)")
                }
                Spacer()
                
                Section {
                    Text("You should play")
                    HStack{
                        ForEach(0...2, id: \.self){index in
                            Button(action: {self.checkAnswer(usersAnswer: index)}) {
                                Text(self.gameChoices[index])
                            }
                        }
                    }
                }
                
                Spacer()
                Section{
                    Text("Score: \(self.score)")
                }
                Spacer()
            }
            .alert(isPresented: $showingResult){
                Alert(title: Text("\(self.result)"), primaryButton: .default(Text("Continue")) {
                    self.continueGame()
                }, secondaryButton: .default(Text("New Game")) {
                    self.newGame()
                })
            }
        }
    }
    
    func checkAnswer(usersAnswer: Int) {
        if usersAnswer == self.correctAnswer{
            score+=1
            result = "WIN"
        }else{
            score-=1
            result = "LOSE"
        }
        showingResult = true
    }
    
    func continueGame() {
        computerChoice = Int.random(in: 0...2)
        options = Bool.random() ? "WIN" : "LOSE"
    }
    
    func newGame() {
        continueGame()
        score = 0
    }
    
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
