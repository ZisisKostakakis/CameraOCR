////
////  MatchedGeo.swift
////  CameraOCR
////
////  Created by Zisis Kostakakis on 30/01/2022.
////
//
//import SwiftUI
//
//struct MatchedGeo: View {
//    @Namespace private var namespace
//    @State private var show = false
//    
//    var body: some View {
//        
//        ZStack {
//            if !show {
//                VStack (alignment: .center, spacing: 12){
//                    
//                    Text("Email")
//                        .font(.largeTitle.weight(.bold))
//                        .matchedGeometryEffect(id: "text", in: namespace)
//                        .frame(maxWidth: .infinity,alignment: .center)
//                    Text("How to use")
//                        .font(.largeTitle.weight(.bold))
//                        .matchedGeometryEffect(id: "subtitle", in: namespace)
//                        .frame(maxWidth: .infinity,alignment: .center)
//                        
//                }
//                .foregroundColor(.white)
//                .background(
//                    Image("background 1")
//                        .resizable()
//                        .aspectRatio( contentMode: .fill)
//                        .matchedGeometryEffect(id: "background", in: namespace)
//                )
//                .mask({
//                    RoundedRectangle(cornerRadius: 30, style: .continuous)
//                        .matchedGeometryEffect(id: "mask", in: namespace)
//                })
//                .padding(40)
//                
//            }
//            else {
//                VStack (alignment: .center, spacing: 12){
//                    Text("Email")
//                        .font(.largeTitle.weight(.bold))
//                        .matchedGeometryEffect(id: "text", in: namespace)
//                        .frame(maxHeight: .infinity, alignment: .top)
//                        .padding(.vertical)
//                        .padding(.vertical)
//                    
//                    Text("How to use")
//                        .font(.largeTitle.weight(.bold))
//                        .matchedGeometryEffect(id: "subtitle", in: namespace)
//                        .frame(maxWidth: .infinity,alignment: .center)
//                        .padding(.vertical)
//                    
//                }
//                .foregroundColor(.white)
//                .background(
//                    Image("background 1")
//                        .resizable()
//                        .aspectRatio( contentMode: .fill)
//                        .matchedGeometryEffect(id: "background", in: namespace)
//                )
//                .mask({
//                    RoundedRectangle(cornerRadius: 30, style: .continuous)
//                        .matchedGeometryEffect(id: "mask", in: namespace)
//                })
//                .edgesIgnoringSafeArea([.bottom])
//                .edgesIgnoringSafeArea([.bottom])
//                .edgesIgnoringSafeArea([.top])
//                
//                
//                
//                
//                
//                
//            }
//        }.onTapGesture {
//            withAnimation(.spring(response: 1, dampingFraction: 0.8)) {show.toggle()
//                
//            }
//            
//        }
//        
//    }
//}
//
//
//struct MatchedGeo_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchedGeo()
//    }
//}
