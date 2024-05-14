//
//  AddPropertyView.swift
//  Keyn
//
//  Created by Jood Khoja on 26/10/1445 AH.
//

import SwiftUI

struct AddPropertyView: View {
    var body: some View {
        Text("Add Property")
            .font(.title)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding(.top,-35)
        PersonalInfo()
        
    }
}
struct PersonalInfo: View {
    @State private var firstName: String = ""
    @State var gender = "Select Gender"
    @State var city = "Select City"
    @State var province = "Select Province"
    @State private var selectedDate = Date()
    @State private var showHomeView = false // State variable to control navigation
  var body: some View {
          ScrollView{
              ZStack{
                  Color(.background)
                      .ignoresSafeArea(.all)
                  VStack (alignment: .leading){
                      Text("Property Information")
                          .font(.title)
                          .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                      HStack{
                          Text("All field marked with")
                          Text("*")
                              .foregroundColor(.red)
                              .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                          Text("are required")
                      }.fontWeight(.thin)
                      Divider()
                      Text("About Owner")
                          .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                          .padding(.bottom,5)
                      Form{
                          VStack(alignment: .leading) {
                              Text("Full name")
                              Text(firstName)
                              ZStack {
                                  RoundedRectangle(cornerRadius: 7)
                                      .stroke(Color.gray, lineWidth: 1)
                                  TextField("", text: $firstName)
                                      .frame(height: 40)
                                      .padding(.leading)
                              }
                              HStack{
                                  Text("Gender")
                                  Spacer()
                                  Menu{
                                      Button(action: {
                                          gender = "Female"
                                      }, label: {
                                          Text("Female")
                                      })
                                      Button(action: {
                                          gender = "Male"
                                      }, label: {
                                          Text("Male")
                                      }).foregroundColor(.accentColor)
                                  }label: {
                                      HStack {
                                          Text("\(gender)")
                                          Image(systemName: "chevron.down")
                                      }
                                  }.padding(7)
                                      .foregroundColor(.gray)
                                      .overlay(
                                        RoundedRectangle(cornerRadius:4)
                                            .stroke(Color.gray, lineWidth: 1)
                                            .frame(width:150)
                                      )
                                  
                                  Spacer()
                              }
                              HStack{
                                  Text("Birthday")
                                  Spacer()
                                  DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                  Spacer()
                              }
                              HStack{
                                  Text("National ID")
                                  Spacer()
                                  Text("Phone Number")
                                      .padding(.leading,40)
                                  Spacer()
                              }.padding(.top)
                              
                              HStack{
                                  ZStack {
                                      RoundedRectangle(cornerRadius: 7)
                                          .stroke(Color.gray, lineWidth: 1)
                                      TextField("", text: $firstName)
                                          .keyboardType(.numberPad)
                                          .frame(height: 40)
                                          .padding(.leading)
                                  }
                                  
                                  
                                  ZStack {
                                      RoundedRectangle(cornerRadius: 7)
                                          .stroke(Color.gray, lineWidth: 1)
                                      TextField("", text: $firstName)
                                          .frame(height: 40)
                                          .padding(.leading)
                                  }
                              }
                              Text("Email")
                              ZStack {
                                  RoundedRectangle(cornerRadius: 7)
                                      .stroke(Color.gray, lineWidth: 1)
                                  TextField("", text: $firstName)
                                      .frame(height: 40)
                                      .padding(.leading)
                              }
                              Divider()
                              Text("Address")
                                  .fontWeight(.semibold)
                                  .padding(.top)
                              HStack{
                                  Text("Area")
                                  Spacer()
                                  Menu{
                                      Button(action: {
                                          province = "Jeddah"
                                      }, label: {
                                          Text("Jeddah")
                                      })
                                      Button(action: {
                                          province = "Eastren Province"
                                      }, label: {
                                          Text("Eastren Province")
                                      }).foregroundColor(.accentColor)
                                  }label: {
                                      HStack {
                                          Text("\(province)")
                                          Image(systemName: "chevron.down")
                                      }
                                  }.padding(7)
                                      .foregroundColor(.gray)
                                      .overlay(
                                        RoundedRectangle(cornerRadius:4)
                                            .stroke(Color.gray, lineWidth: 1)
                                            .frame(width:200))
                                  Spacer()
                              }
                              
                              HStack{
                                  Text("City")
                                  Spacer()
                                  Menu{
                                      Button(action: {
                                              city = "Jeddah"
                                          }, label: {
                                              Text("Jeddah")
                                          })
                                          Button(action: {
                                              city = "Riyadh"
                                          }, label: {
                                              Text("Riyadh")
                                          }).foregroundColor(.accentColor)
                                      }label: {
                                          HStack {
                                              Text("\(city)")
                                              Image(systemName: "chevron.down")
                                          }
                                      }.padding(7)
                                          .foregroundColor(.gray)
                                          .overlay(
                                            RoundedRectangle(cornerRadius:4)
                                                .stroke(Color.gray, lineWidth: 1)
                                                .frame(width:200))
                                  Spacer()
                              }
                              
                          }
                      }
                      .formStyle(.columns)
                      .font(.callout)
                      Text("1/4")
                          .foregroundColor(.gray)
                          .padding(.leading,330)
                          .padding(.top)
                  }.padding()
              }
          }
          HStack{
              Spacer()
              
              Button{
                  showHomeView = true
              }label: {
                  Text("Continue")
                      .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
              }
              .padding(.horizontal,10)
              .padding(9)
              .foregroundColor(.white)
              .background(Color.accentColor)
              .cornerRadius(4)
              
          }.padding(.trailing)
          .padding()
          NavigationLink(destination: PropertyInfo(), isActive: $showHomeView) {
              
          }
      }
  }

struct PropertyInfo: View {
    var body: some View {
        Text("2/4")

    }
}
#Preview {
    AddPropertyView()
}
