//
//  TabView.swift
//  CameraOCR
//
//  Created by Zisis Kostakakis on 28/01/2022.
//

import SwiftUI

struct Tab_View: View {
    
    var body: some View {
        view1()
//        view_withGeometry()
        
        
    }
}
struct view1: View {
    var body: some View{
        ZStack{
            TabView {
                ContentView()
                    .tabItem {
                        Label("Email", systemImage: "envelope")
                    }.tag(0)
                
                ToDoView()
                    .tabItem {
                        Label("To Do", systemImage: "list.bullet.circle")
                    }.tag(1)
                CreateNotificationsView()
                    .tabItem {
                        Label("Notifications", systemImage: "alarm.fill")
                    }.tag(2)
            }.accentColor(Color.purple)
        }
    }
}


//struct view_withGeometry: View {
//    @State var show = false
//    @Namespace var namespace
//    var body: some View {
//        //        geometry effect view in tab view working on it
//        ZStack {
//            withAnimation { ContentView() }
//            if !show {
//                EmailViewSmall(namespace: namespace, show: $show).contentShape(Rectangle())
//                    .onTapGesture {
//                        withAnimation(.spring(response: 0.6, dampingFraction: 1)) {show.toggle()
//                        }
//                    }
//            }
//            if show {EmailViewExpand(namespace: namespace, show: $show)}
//            
//        }
//    }
//}




struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        
        Tab_View()
            .preferredColorScheme(.light)
    }
}
