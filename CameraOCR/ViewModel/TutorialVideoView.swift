
import Foundation
import AVKit
import SwiftUI

struct TutorialVideoView: View {
    @State private var player = AVPlayer()
    
    var body: some View {
       VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all).onAppear(perform: {
                //Enable this when needed because its messing with other audio programs youtube music
                player = AVPlayer(url: Bundle.main.url(forResource: "VideoTutorial", withExtension: "mp4")!)
            })
    }
}
struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialVideoView()
    }
}
