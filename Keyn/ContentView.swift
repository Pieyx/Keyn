//
//  ContentView.swift
//  Keyn
//
//  Created by Jood Khoja on 12/10/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State var city = "City"
    @State var PropretyType = "Proprety type"
    @State var showStoreDropDown: Bool = false
    @State private var showSheets: Bool = false
    @State private var showAddProp = false
    var body: some View {
        
        NavigationStack {
             ZStack{
                 Color(.background)
                     .ignoresSafeArea(.all)
                 VStack{
                     HStack{
                         Menu{
                             Button(action: {
                                 city = "Riyadh"
                             }, label: {
                                 Text("Riyadh")
                             })
                             Button(action: {
                                 city = "Jeddah"
                             }, label: {
                                 Text("Jeddah")
                             })
                         }label: {
                             Label(
                                title:{Text("\(city)")},
                                icon:{Image(systemName: "chevron.down")}
                             )
                         }
                         .padding(7)
                         .background(Color.gray2)// Set white background
                             .overlay(
                                 RoundedRectangle(cornerRadius:4)
                                    .stroke(Color.accentColor, lineWidth: 1) // Pink border with 2 points thickness
                             )
                         Menu{
                             Button(action: {
                                 PropretyType = "Apartment"
                             }, label: {
                                 Text("Apartment")
                             })
                             Button(action: {
                                 PropretyType = "Villa"
                             }, label: {
                                 Text("Villa")
                             })
                         }label: {
                             Label(
                                title:{Text("\(PropretyType)")},
                                icon:{Image(systemName: "chevron.down")}
                             )
                         }
                         .padding(7)
                         .background(Color.gray2) // Set white background
                             .overlay(
                                 RoundedRectangle(cornerRadius:4)
                                    .stroke(Color.accentColor, lineWidth: 1) // Pink border with 2 points thickness
                             )
                         Spacer()
                         Button{ // Filter
                             showSheets.toggle()
                         }label: {
                             Image(systemName: "slider.horizontal.3")
                             
                         }
                         .padding(7)
                         .foregroundColor(.white)
                         .background(Color.accentColor)
                         .cornerRadius(4)
                         .sheet(isPresented:$showSheets){
                             FilterView(vm: FilterViewModel())
                         }
                     }
                     .padding()
                     HStack{
                         VStack{
                             Text("195 prop")
                                 .foregroundColor(.gray)
                             RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                 .fill(Color(red: 0.9803921568627451, green: 0.9215686274509803, blue: 0.9450980392156862))
                                        .frame(width:60, height: 25)
                                        .overlay(
                                            Text("5 new")
                                                .foregroundColor(.pink)
                                                .fontWeight(.bold)
                                        )
                                
                         }.font(.footnote)
                         Spacer()
                         Button{
                             showAddProp=true
                         }label: {
                             Image(systemName: "plus")
                                 .fontWeight(.bold)
                             Text("Add Proprety")
                                 
                         }
                         .padding(5)
                         .foregroundColor(.white)
                         .background(Color.accentColor)
                         .cornerRadius(4)
                        Menu {
                             VStack{
                                 Button(action: {
                                     
                                 }, label: {
                                     Text("Featured")
                                 })
                                 Button(action: {
                                     
                                 }, label: {
                                     Text("Newest")
                                 })
                                 Button(action: {
                                     
                                 }, label: {
                                     Text("Price (Low)")
                                 })
                                 Button(action: {
                                     
                                 }, label: {
                                     Text("Price (High)")
                                 })
                             }
//                            
                         }label: {
                             Label(
                                title:{Text("Sort")},
                                icon:{Image(systemName: "arrow.up.arrow.down")}
                             )
                         }
                         .padding(5)
                         .background(Color.white) // Set white background
                             .overlay(
                                 RoundedRectangle(cornerRadius:4)
                                    .stroke(Color.accentColor, lineWidth: 1) // Pink border with 2 points thickness
                             )
                     }
                     .padding(.horizontal)
                     ScrollView{
                         
                         SearchedView(searchText: searchText)
                     }
                     
                 }
                 
            }
            NavigationLink(destination: AddPropertyView(), isActive: $showAddProp) {
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
    
}


private struct SearchedView: View {
    var searchText: String
    @State private var showSheets: Bool = false
    @State var keyn1 = Keyn(name: "", fundOwner: "", riskLevel: "", description: "", minLimit: 0, subsRate: 0.0, propertyType: "", Logo: "")
  var searchResults:[Keyn]{
        if searchText.isEmpty{
            return keyns
        } else {
            return keyns.filter { Keyn in
                Keyn.name.contains(searchText)
            }
        }
    }

    @State private var isPresented = false
    @Environment(\.dismissSearch) private var dismissSearch
    
    var body: some View {
        
        ForEach(searchResults, id: \.name) { keyn in
            ZStack{
                NavigationLink(
                    destination: PropertyView(),
                    label:{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                            .fill(Color.white)
                            .padding(.horizontal)
                            .frame(width:390, height: 400)
                        
                    })
                
                VStack {
                    ZStack{
                        Image(keyn.Logo)
                            .resizable()
                            .frame(width:360,height:230)
                            .clipShape(RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0))

                        
                        RoundedRectangle(cornerRadius: 30) // Adjust corner radius as needed
                            .fill(Color.white)
                            .frame(width:30, height: 30)
                            .overlay(
                                Image(systemName: "heart")
                                    .foregroundColor(.accentColor)
                                    .font(.title3)
                            )
                            .offset(x:160,y:-95)
                    }
                    Spacer()
                    HStack{
                        Text(keyn.propertyType)
                        Spacer()
                        Text("1 month")
                    }
                    .foregroundColor(.gray)
                    .padding(.horizontal,25)
                    .font(.caption)
                    Spacer()
                    VStack (alignment: .leading){
                        Text("65,000 / Yearly")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom,5)
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text("Qurtubah, Riyadh, Ar riyadh")
                        }
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        HStack{
                            HStack{
                                Image(systemName: "bed.double")
                                Text("1")
                            }
                            HStack{
                                Image(systemName: "toilet")
                                Text("1")
                            }
                            HStack{
                                Image(systemName: "square")
                                Text("1 ㎡")
                            }
                        }
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .padding(.top,1)
                    }
                    .padding(.leading,-160)
                    
                    HStack{
                        Button{
                            
                        }label: {
                            Image(systemName: "message")
                            Text("Get Contact")
                        }
                        .font(.body)
                        .padding(7)
                        .background(Color.white) // Set white background
                        .overlay(
                            RoundedRectangle(cornerRadius:7)
                                .stroke(Color.accentColor, lineWidth: 1) // Pink border with 2 points thickness
                                .frame(width: 330, height: 30)
                        )
                    }
                }
                .padding(.bottom,10)
            }
        }
    }
    private struct DetailView: View {
        var item: String
        var dismissSearch: DismissSearchAction
        
        
        @Environment(\.dismiss) private var dismiss
        
        
        var body: some View {
            Text("Information about \(item).")
                .toolbar {
                    Button("Add") {
                        // Store the item here...
                        
                        
                        dismiss()
                        dismissSearch()
                    }
                }
        }
    }
    struct AddPropView: View {
      var body: some View {
        Text("Add Prop View")
      }
    }
    struct RoundedCorners: Shape {
        var tl: CGFloat = 0.0
        var tr: CGFloat = 0.0
        var bl: CGFloat = 0.0
        var br: CGFloat = 0.0

        func path(in rect: CGRect) -> Path {
            var path = Path()

            let w = rect.size.width
            let h = rect.size.height

            // Make sure the corner radius values are within bounds
            let tl = min(min(self.tl, h/2), w/2)
            let tr = min(min(self.tr, h/2), w/2)
            let bl = min(min(self.bl, h/2), w/2)
            let br = min(min(self.br, h/2), w/2)

            path.move(to: CGPoint(x: w / 2.0, y: 0))
            path.addLine(to: CGPoint(x: w - tr, y: 0))
            path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
            path.addLine(to: CGPoint(x: w, y: h - br))
            path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: bl, y: h))
            path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
            path.addLine(to: CGPoint(x: 0, y: tl))
            path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

            return path
        }
    }

}

#Preview {
    ContentView()
}
