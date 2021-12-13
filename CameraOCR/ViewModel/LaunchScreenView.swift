/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI
struct Flashcar<Front, Back>: View where Front: View, Back: View {
    @State var flashcardRotation = 0.0
    @State var flipped = false
    var front: () -> Front
    var back: () -> Back
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back) {
        self.front = front
        self.back = back
    }
    var body: some View{
        ZStack{
            if flipped {
                back()
            } else {
                front()
            }
        }
        .padding()
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
        ).cornerRadius(100)
        .padding()

        .onAppear{
            flipFlashcard()
        }.rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z:0))
            .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 0, z:1))
    }
    func flipFlashcard() {
        flipped.toggle()
        withAnimation(Animation.linear(duration: 3.5)){
            flashcardRotation += 360
            flipped.toggle()
        }
    }
}
struct LaunchScreenView: View {
    
    static var shouldAnimate = true
    let launchScreenBackgroundColor = Color("test")
    let uLineWidth: CGFloat = 2
    let uZoomFactor: CGFloat = 2.5
    let lineWidth:  CGFloat = 4
    let lineHeight: CGFloat = 28
    let uSquareLength: CGFloat = 12
    
    @State var percent = 0.0
    @State var uScale: CGFloat = -10
    @State var uScale2: CGFloat = 10
    
    @State var squareColor = Color.black
    @State var squareScale: CGFloat = 1
    @State var lineScale: CGFloat = 1
    @State var textAlpha = 0.0
    @State var textScale: CGFloat = 0.2
    @State var coverCircleScale: CGFloat = 1000
    @State var coverCircleAlpha = 0.0
   
    @State var card1 = 0.0
    @State var content = 0.0
    
    var body: some View {
        ZStack {
            Flashcar(front: {
                Text("")
            }, back: {
                Text("")
            })
            Image("testing")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .opacity(textAlpha)
                .scaleEffect(textScale)
            
            Circle()
                .fill(launchScreenBackgroundColor)
                .frame(width: 10, height: 1,
                       alignment: .center)
                .scaleEffect(coverCircleScale)
                .opacity(coverCircleAlpha)
            HStack{
                Text("L")
                    .font(.largeTitle.weight(.semibold))
                    .foregroundColor(.white)
                    .opacity(textAlpha)
                    .offset(x: -20, y: 0)
                    .scaleEffect(textScale)
                Text("E")
                    .font(.largeTitle.weight(.semibold))
                    .foregroundColor(.white)
                    .opacity(textAlpha)
                    .offset( x:20,y: 0)
                    .scaleEffect(textScale)
            }
            
            AnimatingIcon(percent: percent)
                .stroke(Color.black, lineWidth: uLineWidth)
                .rotationEffect(.degrees(180))
                .aspectRatio(1, contentMode: .fill)
                .padding(20)
                .onAppear() {
                    self.handleAnimations()
                    
                }
                .scaleEffect(uScale * uZoomFactor)
                .frame(width: 65, height: 35,
                       alignment: .center)
            
            AnimatingIcon(percent: percent)
                .stroke(Color.black, lineWidth: uLineWidth)
                .rotationEffect(.degrees(-90))
                .aspectRatio(1, contentMode: .fill)
                .padding(20)
                .onAppear() {
                    self.handleAnimations()
                    
                }
                .scaleEffect(uScale * uZoomFactor )
                .frame(width: 65, height: 35,
                       alignment: .center)
            
            AnimatingIcon(percent: percent)
                .stroke(Color.black, lineWidth: uLineWidth)
                .rotationEffect(.degrees(-180))
                .aspectRatio(1, contentMode: .fill)
                .padding(20)
                .onAppear() {
                    self.handleAnimations()
                    
                }
                .scaleEffect(uScale2 * uZoomFactor )
                .frame(width: 65, height: 35,
                       alignment: .center)
            
            
            
            Rectangle()
                .fill(squareColor)
                .scaleEffect(squareScale * uZoomFactor)
                .frame(width: uSquareLength, height: uSquareLength,
                       alignment: .center)
                .onAppear() {
                    self.squareColor = self.launchScreenBackgroundColor
                }
            
            Rectangle()
                .fill(launchScreenBackgroundColor)
                .scaleEffect(lineScale, anchor: .bottom)
                .frame(width: lineWidth, height: lineHeight,
                       alignment: .center)
                .offset(x: 0, y: -22)
            
            Spacer()
        }
        .background(launchScreenBackgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

extension LaunchScreenView {
    var uAnimationDuration: Double { return 2.5 }
    var uAnimationDelay: Double { return  0.4 }
    var uExitAnimationDuration: Double { return 0.3 }
    var finalAnimationDuration: Double { return 0.4 }
    var minAnimationInterval: Double { return 0.05 }
    var fadeAnimationDuration: Double { return 0.3 }
    
    func handleAnimations() {
        animationStep1()
        animationStep2()
        animationStep3()
        
        //        if LaunchScreenView.shouldAnimate {
        //            restartAnimation()
        //        }
    }
    
    func animationStep1() {
        withAnimation(.easeIn(duration: uAnimationDuration)) {
            percent = 1
            uScale = 10
            uScale2 = -10
            
            lineScale = 0
        }
        withAnimation(.easeOut(duration: uAnimationDuration)) {
            uScale = -10
            uScale2 = 10
            
        }
        withAnimation(.easeIn(duration: uAnimationDuration)) {
            uScale = 15
            uScale2 = -15
        }
        withAnimation(.easeIn(duration: uAnimationDuration)) {
            uScale = 5
            uScale2 = -5
            
        }
        withAnimation(.easeIn(duration: uAnimationDuration)) {
            uScale = 25
            uScale2 = -20
        }
        
        withAnimation(Animation.easeIn(duration: uAnimationDuration).delay(1.5)) {
            textAlpha = 1.0
        }
        
        
        let deadline: DispatchTime = .now() + uAnimationDuration + uAnimationDelay
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            
            withAnimation(.easeOut(duration: self.uExitAnimationDuration)) {
                self.uScale = 5
                self.uScale2 = -5
                self.lineScale = 0
            }
            withAnimation(.easeOut(duration: self.minAnimationInterval)) {
                self.squareScale = 1
            }
            
            withAnimation(Animation.spring(response: 1.3, dampingFraction: 0.3)) {
                self.textScale = self.uZoomFactor
            }
        }
    }
    
    func animationStep2() {
        let deadline: DispatchTime = .now() + uAnimationDuration + uAnimationDelay + minAnimationInterval
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.squareColor = Color.black
            self.squareScale = 1
            withAnimation(.easeOut(duration: self.fadeAnimationDuration)) {
                self.coverCircleAlpha = 1
                self.coverCircleScale = 1000
            }
        }
    }
    
    func animationStep3() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2*uAnimationDuration) {
            withAnimation(.easeOut(duration: self.finalAnimationDuration)) {
                self.textAlpha = 0
                self.squareColor = self.launchScreenBackgroundColor
            }
            
        }
    }
    
    func restartAnimation() {
        let deadline: DispatchTime = .now() + 2*uAnimationDuration + finalAnimationDuration
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.percent = 0
            self.textScale = 0.2
            self.coverCircleAlpha = 0
            self.coverCircleScale = 1
            self.handleAnimations()
        }
    }
}

struct AnimatingIcon: Shape {
    var percent: Double
    
    func path(in rect: CGRect) -> Path {
        let end = percent * 360
        var p = Path()
        
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/2,
                 startAngle: Angle(degrees: 0),
                 endAngle: Angle(degrees: end),
                 clockwise: false)
        
        return p
    }
    
    var animatableData: Double {
        get { return percent }
        set { percent = newValue }
    }
}

#if DEBUG
struct TestingAnimationLaunch_Previews : PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
#endif
