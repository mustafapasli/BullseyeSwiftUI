import SwiftUI

struct ContentView: View {
  
  // Properties
  // =========
  
  // Game stats
  @State var score = 0
  @State var round = 1
  
  // User interface views
  @State var alertIsVisible: Bool = false
  @State var sliderValue = 50.0
  @State var target = Int.random(in: 1...100)
  
  var sliderValueRounded: Int {
    Int(sliderValue.rounded())
  }
  
  var sliderTargetDifferance: Int {
    abs(sliderValueRounded - target)
  }
  // User interface content and layout
  var body: some View {
    NavigationView {
      VStack{
        
        Spacer()
        // Target Row
        HStack {
          Text("Put the bullseye as close as you can to:")
          Text("\(target)")
        }
        Spacer()
        // Slider row
        HStack {
          Text("1")
          Slider(value: $sliderValue, in: 1...100)
          Text("100")
        }
        Spacer()
        // Button row
        Button(action: {
          print("Button pressed!")
          self.alertIsVisible = true
        }) {
          Text("Hit me!")
        }
        .alert(isPresented: $alertIsVisible) {
          Alert(title: Text("Hello there!"),
                message: Text("The slider's value is \(sliderValueRounded).\n" +
                              "You earned \(pointsForCurrentRount())"),
                dismissButton: .default(Text("Awesome!")){
                  self.startNewRound()
            })
        }
        
        Spacer()
        // Score row
        HStack {
          Button(action: {
            self.startNewGame()
          }) {
            Text("Start over")
          }
          Spacer()
          Text("Score")
          Text("\(score)")
          Spacer()
          Text("Round:")
          Text("\(round)")
          Spacer()
          NavigationLink(destination: AboutView()) {
            Text("Info")
          }
        }
        .padding(.bottom, 20)
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
  
  //Methods
  func pointsForCurrentRount() -> Int {
    let points: Int
    if sliderTargetDifferance == 0 {
      points = 200
    } else if sliderTargetDifferance == 1 {
      points = 150
    } else {
      points = 100 - sliderTargetDifferance
    }
    return points
  }
  
  func startNewRound() {
    score += pointsForCurrentRount()
    round += 1
    target = Int.random(in: 1...100)
  }
  
  func startNewGame() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
    
  }
}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
  }
}


