////
////  EmailViewExpand.swift
////  CameraOCR
////
////  Created by Zisis Kostakakis on 30/01/2022.
////
//
//import SwiftUI
//
//struct EmailViewExpand: View {
//    var namespace: Namespace.ID
//    @Binding var show: Bool
//    
//    
//    var body: some View {
//        ZStack {
//            cover
//            
//            Button {
//                withAnimation(.spring(response: 0.6, dampingFraction: 1)){show.toggle()
//                }
//            }
//        label: {
//            Image(systemName: "xmark")
//            
//                .font(.body.weight(.bold))
//                .foregroundColor(.secondary)
//                .padding(8)
//                .background(.ultraThinMaterial, in:Circle())
//        }
//        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
//        .padding(20)
//        .ignoresSafeArea()
//        }
//    }
//    
//    var cover: some View {
//        
//        VStack (alignment: .center, spacing: 12){
//            
//            Text("Email")
//                .font(.largeTitle.weight(.bold))
//                .matchedGeometryEffect(id: "text", in: namespace)
//                .frame(maxHeight: .infinity, alignment: .top)
//                .padding(.vertical)
//                .padding(.vertical)
//            
//            Text("How to use")
//                .font(.largeTitle.weight(.bold))
//                .matchedGeometryEffect(id: "subtitle", in: namespace)
//                .frame(maxWidth: .infinity,alignment: .center)
//                .padding(.vertical)
//            
//        }
//        .foregroundColor(.white)
//        .background(
//            Image("background 1")
//                .resizable()
//                .aspectRatio( contentMode: .fill)
//                .matchedGeometryEffect(id: "background", in: namespace)
//        )
//        .mask({
//            RoundedRectangle(cornerRadius: 30, style: .continuous)
//                .matchedGeometryEffect(id: "mask", in: namespace)
//        })
//        .edgesIgnoringSafeArea([.bottom])
//        .edgesIgnoringSafeArea([.bottom])
//        .edgesIgnoringSafeArea([.top])
//    }
//    
//}
//struct EmailViewExpand_Previews: PreviewProvider {
//    @Namespace static var namespace
//    static var previews: some View {
//        EmailViewExpand(namespace: namespace, show: .constant(true))
//    }
//}
