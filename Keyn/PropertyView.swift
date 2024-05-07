//
//  PropertyView.swift
//  Keyn
//
//  Created by Jood Khoja on 19/10/1445 AH.
//

import SwiftUI

struct PropertyView: View {
    let imageNames = ["Apart", "Apart", "Apart","Apart", "Apart", "Apart"]
    var body: some View {
        Image(systemName: "heart")
            .foregroundColor(.accentColor)
            .font(.title)
            .padding(.leading,320)
            .padding(.top,-35)
        ScrollView{
            ZStack{
                Color(.background)
                    .ignoresSafeArea(.all)
                 VStack(spacing: 16) {
                     ScrollView(.horizontal) {
                         HStack(spacing: 10) {
                             ForEach(imageNames, id: \.self) { imageName in
                                 Image(imageName) // Use the asset name directly
                                     .resizable()
                                     .aspectRatio(contentMode: .fill)
                                     .frame(width: 360, height: 230)
                                     .clipped(antialiased: true)
                                     .cornerRadius(10)
                                     .shadow(color: Color.gray.opacity(0.3), radius: 5)
                             }
                         }
                         .padding()
                     }
                     Text("65,000 / Yearly")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x:-70)
                     ZStack{
                         RoundedRectangle(cornerRadius: 15)
                             .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                             .fill(Color.white)
                             .padding(.horizontal)
                             .frame(width:390, height: 200)
                         HStack{
                             VStack (alignment:.leading){
                                 Image(systemName: "building.2")
                                     .padding(.trailing,10)
                                     .padding(.vertical,5)
                                 Image(systemName: "square")
                                     .padding(.trailing,10)
                                     .padding(.vertical,5)
                                 Image(systemName: "bed.double")
                                     .padding(.trailing,10)
                                     .padding(.vertical,5)
                                 Image(systemName: "toilet")
                                     .padding(.trailing,10)
                                     .padding(.vertical,5)
                                 Image(systemName: "building")
                                     .padding(.trailing,10)
                                     .padding(.vertical,5)
                             }
                             
                             VStack (alignment:.leading){
                                 Text("Property Type:")
                                     .padding(.vertical,2)
                                 Text("Property Size:")
                                     .padding(.vertical,2)
                                 Text("Bedrooms:")
                                     .padding(.vertical,2)
                                 Text("Bathrooms:")
                                     .padding(.vertical,2)
                                 Text("Property age:")
                                     .padding(.vertical,2)
                             }

                             VStack (alignment:.leading){
                                 Text("Apartment")
                                     .padding(.vertical,2)
                                 Text("110 ㎡")
                                     .padding(.vertical,2)
                                 Text("2")
                                     .padding(.vertical,2)
                                 Text("2")
                                     .padding(.vertical,2)
                                 Text("1 Year")
                                     .padding(.vertical,2)
                             }
                             .foregroundColor(.gray)
                             .padding(.leading)

                         }
                         .offset(x:-25)
                     }
                     ZStack{
                         RoundedRectangle(cornerRadius: 15)
                             .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                             .fill(Color.white)
                             .padding(.horizontal)
                             .frame(width:390, height: 250)
                         
                         VStack (alignment:.leading){
                             Text("Amenities")
                                 .font(.title2)
                                 .fontWeight(.bold)
                             HStack{
                                 VStack (alignment:.leading){
                                     Image(systemName: "building.2")
                                         .padding(.trailing,10)
                                         .padding(.vertical,5)
                                     Image(systemName: "square")
                                         .padding(.trailing,10)
                                         .padding(.vertical,5)
                                     Image(systemName: "bed.double")
                                         .padding(.trailing,10)
                                         .padding(.vertical,5)
                                     Image(systemName: "toilet")
                                         .padding(.trailing,10)
                                         .padding(.vertical,5)
                                     Image(systemName: "building")
                                         .padding(.trailing,10)
                                         .padding(.vertical,5)
                                 }
                                 
                                 VStack (alignment:.leading){
                                     Text("Property Type")
                                         .padding(.vertical,5)
                                     Text("Property Size")
                                         .padding(.vertical,2)
                                     Text("Bedrooms")
                                         .padding(.vertical,5)
                                     Text("Bathrooms")
                                         .padding(.vertical,2)
                                     Text("Property age")
                                         .padding(.vertical,5)
                                 }
                                 HStack{
                                     VStack (alignment:.leading){
                                         Image(systemName: "building.2")
                                             .padding(.trailing,10)
                                             .padding(.vertical,5)
                                         Image(systemName: "square")
                                             .padding(.trailing,10)
                                             .padding(.vertical,5)
                                         Image(systemName: "bed.double")
                                             .padding(.trailing,10)
                                             .padding(.vertical,5)
                                         Image(systemName: "toilet")
                                             .padding(.trailing,10)
                                             .padding(.vertical,5)
                                         Image(systemName: "building")
                                             .padding(.trailing,10)
                                             .padding(.vertical,5)
                                     }
                                     
                                     VStack (alignment:.leading){
                                         Text("Property Type")
                                             .padding(.vertical,5)
                                         Text("Property Size")
                                             .padding(.vertical,2)
                                         Text("Bedrooms")
                                             .padding(.vertical,5)
                                         Text("Bathrooms")
                                             .padding(.vertical,2)
                                         Text("Property age")
                                             .padding(.vertical,5)
                                     }
                                 }
                                 .padding(.leading,25)
                             }
                             .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                             }
                         }
                     ZStack{
                         RoundedRectangle(cornerRadius: 15)
                             .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                             .fill(Color.white)
                             .padding(.horizontal)
                             .frame(width:390, height: 100)
                         VStack(alignment: .leading){
                             Text("Location")
                                 .fontWeight(.bold)
                                 .font(.title2)
                             Text("Qurtubah, Riyadh, Saudi Arabia")
                                 .foregroundColor(.gray)
                         }
                         .padding(.leading,-70)
                     }
                     }
                    
                }
                
            }
        HStack{
            Button{ // Filter

            }label: {
                Image(systemName: "key")
                Text("Rent Order")
                
            }
            .padding(.horizontal,10)
            .padding(9)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(4)
            Spacer()
            Button{ // Filter

            }label: {
                Image(systemName: "message")
                Text("Get Contact")
                
            }
            .padding(7)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius:4)
                .stroke(Color.accentColor, lineWidth: 1) // Pink border with 2 points thickness
                    .frame(width: 200, height: 40)
            )
            Spacer()
        }
        .padding()
        
    }
        
}

#Preview {
    PropertyView()
}
