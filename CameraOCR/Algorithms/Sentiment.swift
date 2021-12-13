////
////  Sentiment.swift
////  CameraOCR
////
////  Created by Zisis Kostakakis on 17/01/2022.
////
//
//import Foundation
//import NaturalLanguage
//
//func sentimentAnalysis() {
//    
//    let tagger = NLTagger(tagSchemes: [.tokenType, .sentimentScore])
//    tagger.string = values.context
//    let (sentiment, _) = tagger.tag(at: values.context.startIndex, unit: .paragraph, scheme: .sentimentScore)
//
////    tagger.enumerateTags(in: values.context.startIndex..<values.context.endIndex, unit: .paragraph,
////                         scheme: .sentimentScore, options: []) { sentiment, _ in
////
////        var sentimentB = ""
//        if sentiment?.rawValue == "-1.0" ||  sentiment?.rawValue == "-0.9" || sentiment?.rawValue == "-0.8" ||  sentiment?.rawValue == "-0.7" || sentiment?.rawValue == "-0.6"  {
//            print("Very Negative")
////            sentimentB = "very negative"
//        } else  if sentiment?.rawValue == "-0.5" ||  sentiment?.rawValue == "-0.4" || sentiment?.rawValue == "-0.3" ||  sentiment?.rawValue == "-0.2" || sentiment?.rawValue == "-0.1"  {
//            print("Negative")
////            sentimentB = "negative"
//        }
//          else if sentiment?.rawValue == "0.1" ||  sentiment?.rawValue == "0.2" || sentiment?.rawValue == "0.3" ||  sentiment?.rawValue == "0.4" || sentiment?.rawValue == "0.5"  {
//            print("Positive")
////              sentimentB = "positive"
//          } else if sentiment?.rawValue == "0.0"{
//            print("Neutral")
////              sentimentB = "neutral"
//          }
//        else if sentiment?.rawValue == "0.6" ||  sentiment?.rawValue == "0.7" || sentiment?.rawValue == "0.8" ||  sentiment?.rawValue == "0.9" || sentiment?.rawValue == "1.0"  {
//            print("Very Positive")
////            sentimentB = "very positive"
//        } else if sentiment?.rawValue == "Other"{
//            print("We have a problem")
////            sentimentB = "error"
//        }
//
//}
