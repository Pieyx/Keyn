//
//  OnBoardingView.swift
//  Keyn
//
//  Created by Jood Khoja on 11/11/1445 AH.
//

//import SwiftUI

//struct OnBoardingView: View {
//    @State private var sliderValue: Double = 0.5
//    @State private var show=false
//    @State private var home=false
//
//    var body: some View {
//        NavigationStack{
//            ZStack {
//                Image("Splash")
//                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
//                VStack{
//                    Button{
//                        home=true
//                        print("Home is :\(home)")
//                    } label: {
//                        Text("Skip")
//                            .foregroundColor(.gray)
//                            .underline()
//                            .offset(x:150)
//                            .font(.footnote)
//                    }
//                    Spacer()
//                    Image("Keyn")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 70, height: 70)
//                    
//                    Text("Her Key, Her\n\t   Keyn!")
//                        .foregroundColor(.accentColor)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                    Text("Welcome to our \nwomen-centric \nreal estate app,")
//                        .foregroundColor(.white)
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .padding()
//                        .multilineTextAlignment(.center)
//                    Text("Let's embark on your property search journey \n\t\t\t\t\ttogether!")
//                        .foregroundColor(.white)
//                        .font(.body)
//                    Spacer()
//                    ZStack{
//                        Capsule()
//                            .fill(Color.white.opacity(0.5))
//                            .frame(width:70,height: 4)
//                        Capsule()
//                            .fill(Color.white)
//                            .frame(width: CGFloat(sliderValue)*50, height: 4)
//                            .offset(x:-25)
//                    }
//                    Button{
//                        show=true
//                    } label: {
//                        Text("Next")
//                            .font(.headline)
//                            .foregroundStyle(Color.white)
//                            .frame(width: 330, height: 40)
//                            .background(Color.accentColor)
//                            .cornerRadius(8)
//                    }.padding()
//                    
//                    
//                }
//            }
//                .navigationDestination(isPresented: $show){
//                    secondBoarding()
//                }
//                .navigationDestination(isPresented: $home){
//                    AuthView()
//                }
//            
//        }//end of navigationstack
//    }
//}
import SwiftUI

struct OnBoardingView: View {
    @State private var sliderValue: Double = 0.5
    @State private var show = false
    @State private var home = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("Splash")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            home = true
                            print("Home is: \(home)")
                        } label: {
                            Text("Skip")
                                .foregroundColor(.gray)
                                .underline()
                                .font(.footnote)
                        }
                    }
                    .padding()

                    Spacer()

                    Image("Keyn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)

                    Text("Her Key, Her\n\t   Keyn!")
                        .foregroundColor(.accentColor)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Welcome to our \nwomen-centric \nreal estate app,")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)

                    Text("Let's embark on your property search journey \n\t\t\t\t\ttogether!")
                        .foregroundColor(.white)
                        .font(.body)

                    Spacer()

                    ZStack {
                        Capsule()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 70, height: 4)
                        Capsule()
                            .fill(Color.white)
                            .frame(width: CGFloat(sliderValue) * 50, height: 4)
                            .offset(x: -25)
                    }

                    Button {
                        show = true
                    } label: {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 330, height: 40)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            .navigationDestination(isPresented: $show) {
                secondBoarding()
            }
            .navigationDestination(isPresented: $home) {
                AuthView()
            }
        } // end of navigationstack
    }
}





struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

struct secondBoarding: View {
    @State private var sliderValue: Double = 1
    @State private var selection = 0
    @State private var show=false
    @State private var home=false

    var body: some View {
        NavigationStack{
            ZStack {
                Image("Splash")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Button{
                        home=true
                    } label: {
                        Text("Skip")
                            .foregroundColor(.gray)
                            .underline()
                            .offset(x:150)
                            .font(.footnote)
                    }
                    Spacer()
                    Image("Keyn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    
                    Text("What are you interested in?")
                        .foregroundColor(.accentColor)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Picker("Selection", selection: $selection) {
                        Text("Rent")
                            .tag(0)
                        Text("Buy")
                            .tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 250)
                    
                    Spacer()
                    ZStack{
                        Capsule()
                            .fill(Color.white.opacity(0.5))
                            .frame(width:70,height: 4)
                        Capsule()
                            .fill(Color.white)
                            .frame(width: CGFloat(sliderValue)*50, height: 4)
                            .offset(x:-25)
                    }
                    Button{
                        show=true
                    } label: {
                        Text("Next")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .frame(width: 330, height: 40)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }.padding()
                    
                    
                }
                .navigationDestination(isPresented: $show){
                    endBoarding()
                }
                .navigationDestination(isPresented: $home){
                    AuthView()
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}
struct endBoarding: View {
    @State private var sliderValue: Double = 1.5
    @State private var selection = 0
    @State private var home=false

    var body: some View {
        NavigationStack{
            ZStack {
                Image("Splash")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Image("Keyn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    
                    Text("Where in Saudi Arabia \nare you looking to rent?")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    Picker("Selection", selection: $selection) {
                        Text("Riyadh")
                            .tag(0)
                        Text("Jeddah")
                            .tag(1)
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(width: 300)
                    .background(.white)
                    .cornerRadius(8)
                    
                    Spacer()
                    Button{
                        home=true
                    } label: {
                        Text("Let's Keyn")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .frame(width: 150, height: 40)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }.padding()
                        .offset(x:100,y:-20)
                    
                    
                }
                .navigationDestination(isPresented: $home){
                    AuthView()
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    endBoarding()
}
