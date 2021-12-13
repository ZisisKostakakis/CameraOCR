//
//  Mainview.swift
//  CameraOCR
//
//  Created by Zisis Kostakakis on 30/01/2022.
//

import SwiftUI

struct Mainview: View {
    @State var showSplash = true
    var body: some View {
        ZStack{
            if showSplash == false{
                Tab_View()}
        LaunchScreenView().opacity(showSplash ? 1 : 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                  LaunchScreenView.shouldAnimate = false
                withAnimation() {
                  self.showSplash = false
                }
              }
          }
           
        }
    }
}

struct Mainview_Previews: PreviewProvider {
    static var previews: some View {
        Mainview()
    }
}
