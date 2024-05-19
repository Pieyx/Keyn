//
//  AuthView.swift
//  Keyn
//
//  Created by Jood Khoja on 11/11/1445 AH.
//

import SwiftUI

struct AuthView: View {
    @State var mobileNo: String = ""
    @State private var isAction1Done=false
    var body: some View {
        NavigationStack() {
            ZStack{
                Color(.background)
                    .ignoresSafeArea(.all)
                VStack{
                    Text("Unlock Your \n🗝️\tKeyn!")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Let’s log-in with your phone number \t\t\t\tand get started!")
                        .foregroundColor(.gray)
                        .padding(30)
                    
                    HStack{
                        Text("+966")
                            .foregroundColor(.gray)
                            .frame(width:80, height: 70)
                            .background(.white)
                            .cornerRadius(8)
                        TextField("5 _ _ _ _ _ _ _ _",text:$mobileNo)
                            .frame(width:250, height: 70)
                            .padding(.leading,20)
                            .background(.white)
                            .cornerRadius(8)
                            .keyboardType(.numberPad)
                            .onChange(of: mobileNo) { newValue in
                                // Allow only digits and limit to 10 characters
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered.count <= 9 {
                                    mobileNo = filtered
                                } else {
                                    mobileNo = String(filtered.prefix(9))
                                }
                            }
                        
                    }
                    Spacer()
                    Button{
                        isAction1Done=true
                    } label: {
                        Text("Proceed")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .frame(width: 330, height: 40)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .padding(.top,100)
                .navigationDestination(isPresented: $isAction1Done){
                    OTPCodeView()
                }
                .navigationTitle("Sign in with Phone")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}
struct  OTPCodeView : View {
    @State private var otpCode: String = ""
    @State private var isAction1Done=false
    @State private var change=false
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.background)
                    .ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Image(systemName: "lock.open.ipad")
                        .font(.system(size: 80, weight: .semibold))
                        .foregroundColor(.accentColor)
                        .padding(.top,-200)
                    HStack{
                        Text("+966 56707658")
                            .foregroundColor(.gray)
                        Button{
                            change=true
                        } label:{
                            Image(systemName: "pencil")
                                .foregroundColor(.black)
                        }
                    }
                    TextField("OTP Code", text: $otpCode)
                        .frame(width:320, height: 60)
                        .padding(.leading)
                        .background(.white)
                        .cornerRadius(8)
                        .multilineTextAlignment(.center)
                    Button{
                       
                    } label: {
                        Text("Didn’t receive the OTP code? ")
                            .foregroundColor(.gray)
                        Text("Resend Code")
                            .fontWeight(.semibold)
                            .underline()
                            
                    }.font(.footnote)
                        .padding(.top)
                    Spacer()
                    Button{
                        isAction1Done=true
                    } label: {
                        Text("Verify")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .frame(width: 330, height: 40)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .navigationTitle("OTP")
                //            .navigationDestination(isPresented: $viewModel.isAction2Done){
                //                ListView()
                //            }
                .navigationDestination(isPresented: $change){
                    AuthView()
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}
#Preview {
    OTPCodeView()
}
