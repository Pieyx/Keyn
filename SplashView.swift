import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    @State private var isAnimating = false
    @State private var moveOut = false
    @State private var showText = false
    @State private var displayedText = ""
    @State private var currentIndex = 0

    private let fullText = "Keyn|كِن"
    private let typingSpeed = 0.3

    var body: some View {
        ZStack {
            Image("Splash")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            if self.isActive {
                OnBoardingView()
            } else {
                Image("Keyn")
                    .offset(x: moveOut ? UIScreen.main.bounds.width : 0, y: 20.0)
                    .scaleEffect(1.0)
                    .animation(moveOut ? .easeInOut(duration: 1.0).delay(1.7) : .easeInOut(duration: 1.7), value: moveOut)
                    .onAppear {
                        isAnimating.toggle()
                    }
                
                if showText {
                    Text(displayedText)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .animation(.easeInOut(duration: 1.5), value: showText)
                        .onAppear {
                            startTyping()
                        }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.spring()) {
                    self.moveOut = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.showText = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    self.isActive = true
                }
            }
        }
    }

    private func startTyping() {
        displayedText = ""
        currentIndex = 0
        Timer.scheduledTimer(withTimeInterval: typingSpeed, repeats: true) { timer in
            if currentIndex < fullText.count {
                let index = fullText.index(fullText.startIndex, offsetBy: currentIndex)
                displayedText.append(fullText[index])
                currentIndex += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

struct ken: View {
        @State var isActive: Bool = false
        @State private var scale: CGFloat = 0
        @State private var isAnimating = false


        var body: some View {
            ZStack{
                Image("Splash")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                if self.isActive {
                    SplashView()
                } else {
                    Image("Keyn")
                        .offset(y:isAnimating ? 20.0 : -70.0)
                        .scaleEffect(isAnimating ? 1.0 : 0.5)
                        .animation(.spring( response: 1.7), value: isAnimating)
                        .onAppear {
                            isAnimating.toggle()
                        }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation(.spring()) {
                        self.isActive = true
                    }
                }
            }
        }
}
#Preview {
    ken()
}
