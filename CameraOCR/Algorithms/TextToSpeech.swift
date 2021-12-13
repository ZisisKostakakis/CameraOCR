//
//  TextToSpeech.swift
//  CameraOCR
//
//  Created by Zisis Kostakakis on 25/01/2022.
//

import Foundation
import AVKit

class TextToSpeech: NSObject{
    static let shared = TextToSpeech()
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    func startSpeech(_ text: String) {
            if let language = NSLinguisticTagger.dominantLanguage(for: text) {
            let utterence = AVSpeechUtterance(string: text)
            utterence.voice = AVSpeechSynthesisVoice(language: language)
            
            speechSynthesizer.speak(utterence)
        }
    }
    func stopSpeech() {
        
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
}
