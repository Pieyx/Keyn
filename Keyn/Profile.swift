//
//  Profile.swift
//  Keyn
//
//  Created by Jood Khoja on 12/10/1445 AH.
//

import SwiftUI

struct Profile: View {
    
    // Sample user data (replace with your data source)
    let name = "John Doe"
    let bio = "Mobile developer with a passion for building beautiful and functional apps."
    let imageName = "person.circle"

    var body: some View {
        NavigationStack{
            ZStack{
                Color(.background)
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .center) {
                  // Profile picture
                  
                    Text("My Account")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .offset(x:-80,y:15)
                        .padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                            .fill(Color.white)
                            .padding(.horizontal)
                            .frame(width:390, height: 100)
                        HStack{
                            Image(systemName: imageName)
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 60, height: 100)
                              .clipShape(Circle())
                              .overlay(
                                Circle()
                                  .stroke(lineWidth: 3)
                                  .foregroundColor(.gray)
                              )
                              .padding(.leading,-100)
                            VStack(alignment:.leading){
                                Text(name)
                                  .font(.title)
                                  .fontWeight(.bold)
                                  .foregroundColor(.accentColor)
                                Text("sync")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    VStack {
                        List {
                            NavigationLink(destination: MyRequestView()) { // Link to MyRequestView
                                Label(
                                   title:{Text("Language")},
                                   icon:{Image(systemName: "globe")}
                                )
                            }
                            .listRowSeparator(.hidden)
                        }
                        .cornerRadius(10)
                        .padding(.top,10)
                        List {
                            NavigationLink(destination: AddPropertyView()) { // Link to MyRequestView
                                Label(
                                   title:{Text("Add Property")},
                                   icon:{Image(systemName: "plus.app")}
                                )
                            }
                            NavigationLink(destination: MyPropertiesView()) { // Link to AddPropView
                                Label(
                                   title:{Text("My Properties")},
                                   icon:{Image(systemName: "homekit")}
                                )
                            }
                            .listRowSeparator(.hidden)
                        }
                        .cornerRadius(10)
                        .padding(.top,-80)
                        List {
                            NavigationLink(destination: MyRequestView()) { // Link to MyRequestView
                                Label(
                                   title:{Text("About us")},
                                   icon:{Image(systemName: "info.circle")}
                                )
                            }
                            .listRowSeparator(.hidden)
                            NavigationLink(destination: AddPropertyView()) { // Link to AddPropView
                                Label(
                                   title:{Text("Rate us")},
                                   icon:{Image(systemName: "text.bubble")}
                                )
                            }
                            .listRowSeparator(.hidden)
                            // About Us button
                            NavigationLink(destination: AboutUsView()) { // Link to AboutUsView
                                Label(
                                    title:{Text("Need help?")},
                                    icon:{Image(systemName: "questionmark.circle")}
                                )
                            }
                            .listRowSeparator(.hidden)
                            Button{
                                
                            } label: {
                                Label(
                                   title:{Text("Sign Out")},
                                   icon:{Image(systemName: "rectangle.portrait.and.arrow.forward")}
                                )
                            }
                            .listRowSeparator(.hidden)

                      }
                        .cornerRadius(10)
                        .padding(.top,-120)
                    }
                    .listStyle(.plain)
                    .padding()
                    
                        Button{
                            
                        }label: {
                            Text("Login / Create Account")
                                .font(.title3)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: 330, height: 30)
                        .padding(7)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                        .offset(y:-50)
                    
                        
                }
            }
        }
    }
  }
struct MyRequestView: View {
  var body: some View {
    Text("My Request View")
  }
}

struct AboutUsView: View {
  var body: some View {
    Text("About Us View")
  }
}

#Preview {
    Profile()
}
