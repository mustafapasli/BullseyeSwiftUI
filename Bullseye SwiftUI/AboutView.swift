//
//  AboutView.swift
//  Bullseye SwiftUI
//
//  Created by Mustafa Paslı on 12.12.2020.
//  Copyright © 2020 Mustafa Paslı. All rights reserved.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
     VStack {
      Text("🎯Bullseye🎯")
      Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.")
      Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.")
      Text("Enjoy!")
    }
  }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
          .previewLayout(.fixed(width: 568, height: 320))
    }
}
