////
////  EmailViewSmall.swift
////  CameraOCR
////
////  Created by Zisis Kostakakis on 30/01/2022.
////
//
//import SwiftUI
//
//struct EmailViewSmall: View {
//    var namespace: Namespace.ID
//    @Binding var show: Bool
//    
//    
//    var body: some View {
//        VStack (alignment: .center, spacing: 12) {
//            Text("Email")
//                .font(.largeTitle.weight(.bold))
//                .matchedGeometryEffect(id: "text", in: namespace)
//                .frame(maxWidth: .infinity,alignment: .bottom)
// 
//                
//            Text("How to use")
//                .font(.largeTitle.weight(.bold))
//                .matchedGeometryEffect(id: "subtitle", in: namespace)
//                .frame(maxWidth: .infinity,alignment: .center)      
//        }
//        .foregroundColor(.white)
//        .background(
//            Image("background 1")
//                .resizable()
//                .aspectRatio( contentMode: .fill)
//                .matchedGeometryEffect(id: "background", in: namespace)
//                
//        )
//        .mask({
//            RoundedRectangle(cornerRadius: 30, style: .continuous)
//                .matchedGeometryEffect(id: "mask", in: namespace)
//                
//        })
//        .padding(40)
//        
//    }
//    }
//
//
//struct EmailViewSmall_Previews: PreviewProvider {
//    @Namespace static var namespace
//    static var previews: some View {
//        EmailViewSmall(namespace: namespace, show: .constant(true))
//    }
//}
