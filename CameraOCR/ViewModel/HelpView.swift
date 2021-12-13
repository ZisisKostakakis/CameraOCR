//
//  HelpView.swift
//  CameraOCR
//
//  Created by Zisis Kostakakis on 26/01/2022.
//

import SwiftUI

struct HelpView: View {
    let steps = [
        "Step 1",
        "Step 2",
        "Step 3"
    ]
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{} // steps inside scrollview
                }
            }
            .navigationTitle("Information and Help").titleStyle()
            
        }
}

struct StepsView: View {
    let step: String
    var body: some View{
        Text("dasdfas")
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
