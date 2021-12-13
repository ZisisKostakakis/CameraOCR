//
//  EmptyView.swift
//  CameraOCR
//
//  Created by Zisis Kostakakis on 28/01/2022.
//

import SwiftUI
import UserNotifications
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct CreateNotificationsView: View {
    @State var title: String = ""
    @State var subject: String = ""
    @State var selectedTime = Date()
    @State private var fontSize: CGFloat = 20
    @State var alert = false
    @State var presentAlert = false
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2022, month: Calendar.current.component(.month, from: Date()), day: 1)
        let endComponents = DateComponents(year: 2030, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack{
                    Text("If you need to set a notification/reminder for any activity  \n Fill the notification title and subject \n Then choose the date and exact time").frame( height: 730, alignment: .top).animatableSystemFont(size: fontSize).text().extraText()
                        .onTapGesture {withAnimation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 1)) {if fontSize == 36 {fontSize = 20}else{fontSize = 36}}}.contentShape(Rectangle())
                }
                VStack {
                    Text("Enter Notification Title").font(.title2).padding(.horizontal)
                    TextField("Title",text: $title).disableAutocorrection(true).padding(.horizontal)
                    Text("Enter Notification Subject ").font(.title2).padding(.horizontal)
                    TextField("Subject",text: $subject).disableAutocorrection(true).padding(.horizontal)
                    DatePicker("Choose Date/Time",selection: self.$selectedTime,in: dateRange,displayedComponents: [.date, .hourAndMinute]).padding(.horizontal)
                }.frame(width: 400, height: 300, alignment: .bottomTrailing).textFieldStyle(.roundedBorder)
                
                VStack{
//                    {Button("Learn more") {presentAlert = true}.alert("Alert Message", isPresented: $presentAlert, actions: {}, message: {alertView()})}
                    Button(action: {presentAlert=true;UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
                        {(status, _) in if status {self.sendNotification()} else {self.alert.toggle()}}}
                    ) {
                        Text("Schedule Notification")}.alert(isPresented: $alert)
                    {Alert(title: Text("Please Enable Notification Access from Settings Pannel !!"))}.buttonstyle().disabled(title.isEmpty && subject.isEmpty)
                }.frame( maxHeight: .infinity, alignment: .bottomTrailing).padding(.vertical).padding(.vertical).padding(.vertical)
                
            }
        }
        
    }
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = subject
        content.sound = UNNotificationSound.default
        
        if let thisHour = Calendar.current.dateComponents([.hour], from: Date()).hour,
           let selectedHour = Calendar.current.dateComponents([.hour], from: self.selectedTime).hour,
           let selectedMinute = Calendar.current.dateComponents([.minute], from: self.selectedTime).minute
        {
            if (thisHour >= selectedHour) {
                var dateComponents = DateComponents()
                dateComponents.hour = selectedHour
                dateComponents.minute = selectedMinute
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                print("sent")
            }
        }
    }
}

struct CreateNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNotificationsView()
    }
}
