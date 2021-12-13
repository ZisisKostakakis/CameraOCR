import SwiftUI
import MessageUI
import MediaPlayer
import AVKit

extension View {
    func buttonstyle() -> some View {
        return self
            .foregroundColor(.white)
            .frame(width: 200, height: 60)
            .background(Color.purple)
            .cornerRadius(15)
            .padding()
    }
    
    func titleStyle() -> some View {
        return self
            .navigationTitle("Letter To Email Converter")
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        
    }
    
    func text() -> some View {return self.frame(width: 390)}
    
    func extraText() -> some View {return
        self
            .multilineTextAlignment(.center)
            .font(Font.headline.weight(.semibold))
    }
    
    func tutorialStyle() -> some View {
        return self
            .foregroundColor(.white)
            .frame(width: 60,height: 60)
            .background(Color.purple)
            .clipShape(Circle())
    }
    
    func buttonStyle() -> some View {
        return self
            .foregroundColor(.white)
            .frame(width: 60,height: 40)
            .background(Color.purple)
            .cornerRadius(15)
            .padding()
    }
    
    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))}
}

struct AnimatableSystemFontModifier: AnimatableModifier {
    var size: CGFloat
    var weight: Font.Weight
    var design: Font.Design
    
    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content.font(.system(size: size, weight: weight, design: design))}
}

struct ContentView: View {
    @State var showScannerSheet = false
    @State var texts:[ScanData] = []
    @State private var noText = "No scan yet press the camera icon to scan your letter"
    @State private var helpText = "If you need help press the button below for a quick showcase of the application!"
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var presentAlert = false
    @State var text1:String = values.context
    @State var player = AVPlayer()
    @State private var selection = "Red"
    @State var switchValue = false
    @State var animationAmount = 1.0
    @State private var fontSize: CGFloat = 20
    @State private var fontSize2: CGFloat = 19
    @State private var isAnimated = false
    
    var body: some View {
        NavigationView {
            ZStack{
                if (MFMailComposeViewController.canSendMail())
                {main} else {errorView}
                
            }.titleStyle().sheet(isPresented: $isShowingMailView) {MailView(isShowing: self.$isShowingMailView, result: self.$result)}
        }
    }
    
    var errorView: some View {VStack{alertMSG;alertHandling}}
    
    var alertHandling: some View {Button("Learn more") {presentAlert = true; showScannerSheet = false}.alert("Alert Message", isPresented: $presentAlert, actions: {}, message: {alertView()})}
    
    var alertMSG: some View {Text("Can't send emails from this device, this device is not configured for sending emails").titleStyle().text().extraText()}
    var animation: Animation {
        Animation.linear
    }
    func alertView() -> some View {return Text("You have not set up an email address").titleStyle()}
    
    @ViewBuilder var main: some View { //Maybe move it into another view later on
        //Main View Controlls the main View Strucutre
        if texts.isEmpty{
            if texts.count > 0 { ScrollView{
                if let text = texts.last {Text(text.content).text();HStack(alignment: .bottom, spacing: 12){sendEmailButton;speechButton;pauseButton}}
                
            }
            } else {noScan().frame(height: 650, alignment: .topLeading).animatableSystemFont(size: fontSize).extraText().text()
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 1)) {
                            if fontSize == 35 {fontSize = 20}
                            else
                            {fontSize = 35}
                        }
                    }
                helpText2().frame(height: 270, alignment: .bottom).animatableSystemFont(size: fontSize2).extraText().text()
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 1)) {
                            if fontSize2 == 30 {fontSize2 = 20}
                            else
                            {fontSize2 = 30}
                        }
                    }
            }
            mainImage
            ZStack{
            }.toolbar {ToolbarItem(placement: .navigationBarLeading) {scannerButton}; ToolbarItem(placement: .navigationBarTrailing) {videoTutorialButton}}
            
        }
        else
        {
            if texts.count > 0  { ScrollView{ if let text = texts.last {Text(text.content).text()};HStack(alignment: .bottom, spacing: 12){sendEmailButton;speechButton;pauseButton}}}
            mainImage.hidden()
            HStack(alignment: .bottom){
            }.toolbar {ToolbarItem(placement: .navigationBarLeading) {scannerButton}; ToolbarItem(placement: .navigationBarTrailing) {videoTutorialButton}
            }
            
        }
        if switchValue == true {NavigationLink(destination: TutorialVideoView(), isActive: $switchValue){}}
        
        
    }
    
    var mainImage: some View {  Image("writtingletter")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 310.0, height: 310.0, alignment: .center)
            .clipShape(Circle())
            .position(x: 200, y: 250)
        
    }
    
    var videoTutorialButton: some View {Button(action: {switchValue = true},label: {Image(systemName: "video.circle.fill").buttonStyle()})}
    
    var pauseButton: some View {
        Button(action: {TextToSpeech.shared.stopSpeech()}, label: {Image(systemName: "pause.circle.fill").buttonStyle()}).disabled(texts.isEmpty)}
    
    var speechButton: some View {Button(action: {TextToSpeech.shared.startSpeech(values.context) },label: {Image(systemName: "headphones.circle.fill").buttonStyle()}).disabled(texts.isEmpty)}
    
    var sendEmailButton: some View {Button(action: {self.isShowingMailView.toggle()},label: {Image(systemName: "paperplane.circle.fill").buttonStyle()}).disabled(texts.isEmpty)}
    
    var scannerButton: some View {Button(action: {self.showScannerSheet = true;TextToSpeech.shared.stopSpeech()}, label: {Image(systemName:"camera.fill").font(.title).foregroundColor(.purple)})
            .sheet(isPresented: $showScannerSheet, content: {self.makeScannerView()})
    }
    
    func noScan() -> Text {return Text(noText)}
    func helpText2() -> Text {return Text(helpText)}
    
    private func makeScannerView()-> ScannerView {
        ScannerView(completion: {textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

