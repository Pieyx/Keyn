//
//  SplashView.swift
//  Keyn
//
//  Created by Jood Khoja on 08/11/1445 AH.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    @State private var scale: CGFloat = 0
    @State private var isAnimating = false

    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea(.all)
            if self.isActive {
                ContentView()
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
    SplashView()
}
