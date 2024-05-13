//
//  FilterView.swift
//  Keyn
//
//  Created by Jood Khoja on 22/10/1445 AH.
//

import SwiftUI

enum PropTypes: String, CaseIterable, Codable{
    case apartment = "Apartment"
    case villa = "Villa"
    case duplex = "Duplex"
    case farm = "Farm"
    case roofTop = "Roof Top"
}

enum PricePeriod: String, CaseIterable, Codable{
    case yearly = "Yearly"
    case monthly = "Monthly"
    case weekly = "Weekly"
    case daily = "Daily"
}

enum Furnishings: String, CaseIterable, Codable{
    case furnished = "Furnished"
    case unfurnished = "Unfurnished"
    case partlyFurnished = "Partly furnished"
}

enum Amenities: String, CaseIterable, Codable{
    case garden = "Garden"
    case ac = "Central A/C"
    case laundryRoom = "Laundry Room"
    case kitchenAppliances = "Kitchen Appliances"
    case petsAllowed = "Pets Allowed"
    case bes = "bes"
    case es = "es"
    case bs = "bs"
    case bees = "bees"
    case ess = "ess"
    case bbs = "bbs"
}

struct FilterView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm: FilterViewModel
    @State private var size = 50
    @State private var isAmenitiesExpanded = false
    init(vm: FilterViewModel){
        _vm = StateObject(wrappedValue: vm)
    }
    var body: some View {
        
        
//        ForEach(PropTypes.allCases, id: \.self) { filter in
//            HStack{
//                Image(systemName: vm.contatinsFilter(filter.rawValue) ?
//                      "checkmark.square.fill":"square")
//                .onTapGesture {
//                    if !vm.contatinsFilter(filter.rawValue) {
//                        vm.propTypes.append(filter)
//                    } else {
//                        vm.propTypes.removeAll() { $0.rawValue == filter.rawValue }
//                    }
//                }
//                
//                Text(filter.rawValue)
//            }
//        }
        ZStack{
            Color(.background)
                .ignoresSafeArea(.all)
            ScrollView{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                            .fill(Color.white)
                            .padding(.horizontal)
                            .frame(width:390, height: 200)
                        VStack (alignment: .leading){
                            Text("Prop Type")
                                .fontWeight(.medium)
                                .font(.title2)
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 120))] ) {
                                ForEach(PropTypes.allCases, id: \.self) { type in
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.gray2)
                                        .stroke(vm.contatinsTypes(type.rawValue) ? .darkPink : .gray2)
                                        .frame(height: 50)
                                        .overlay {
                                            Text("\(type.rawValue)")
                                                .foregroundColor(vm.contatinsTypes(type.rawValue) ? .accentColor : .black)
                                        }
                                        .onTapGesture {
                                            if !vm.contatinsTypes(type.rawValue) {
                                                vm.propTypes.append(type)
                                            } else {
                                                vm.propTypes.removeAll { $0.rawValue == type.rawValue }
                                            }
                                        }
                                }
                            }
                        }.padding(.horizontal,40)
                        
                    }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                        .fill(Color.white)
                        .padding(.horizontal)
                        .frame(width: 390, height: 200)
                    
                    VStack(alignment: .leading) {
                        Text("Price Period")
                            .fontWeight(.medium)
                            .font(.title2)
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 120))]) {
                            ForEach(PricePeriod.allCases, id: \.self) { type in
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.gray2)
                                    .stroke(vm.containsPeriod(type.rawValue) ? Color.darkPink : Color.gray2)
                                    .frame(height: 50)
                                    .overlay {
                                        Text("\(type.rawValue)")
                                            .foregroundColor(vm.containsPeriod(type.rawValue) ? Color.accentColor : Color.black)
                                    }
                                    .onTapGesture {
                                        if !vm.containsPeriod(type.rawValue) {
                                            vm.pricePeriod.append(type) // Changed from vm.PricePeriod to vm.pricePeriod
                                        } else {
                                            vm.pricePeriod.removeAll { $0.rawValue == type.rawValue }
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                }

                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                        .fill(Color.white)
                        .padding(.horizontal)
                        .frame(width:390, height: 400)
                    VStack (alignment: .leading){
                        HStack{
                            Image(systemName: "bed.double")
                            Text("Bedrooms")
                                .fontWeight(.medium)
                                .font(.title2)
                        }
                        HStack{
                            ForEach (1...5, id: \.self) { rating in
                                RoundedRectangle(cornerRadius:5)
                                    .fill(.gray2)
                                    .stroke(vm.rating == rating ? .darkPink: .gray2)
                                    .frame(height: 50)
                                    .overlay {
                                        Text("\(rating)")
                                            .foregroundColor(vm.rating == rating ? .accentColor : .black)
                                    }.onTapGesture {
                                        vm.rating = rating
                                    }
                            }
                        }
                        Divider()
                        HStack{
                            Image(systemName: "toilet")
                            Text("Bathrooms")
                                .fontWeight(.medium)
                                .font(.title2)
                        }
                        HStack{
                            ForEach (1...5, id: \.self) { rating in
                                RoundedRectangle(cornerRadius:5)
                                    .fill(.gray2)
                                    .stroke(vm.rating == rating ? .darkPink: .gray2)
                                    .frame(height: 50)
                                    .overlay {
                                        Text("\(rating)")
                                            .foregroundColor(vm.rating == rating ? .accentColor : .black)
                                    }.onTapGesture {
                                        vm.rating = rating
                                    }
                            }
                        }
                        Divider()
                        HStack{
                            Image(systemName: "lamp.floor")
                            Text("Furnishings")
                                .fontWeight(.medium)
                                .font(.title2)
                        }
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 120))] ) {
                            ForEach(Furnishings.allCases, id: \.self) { furn in
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.gray2)
                                    .stroke(vm.containsFurn(furn.rawValue) ? .darkPink : .gray2)
                                    .frame(height: 50)
                                    .overlay {
                                        Text("\(furn.rawValue)")
                                            .foregroundColor(vm.containsFurn(furn.rawValue) ? .accentColor : .black)
                                    }
                                    .onTapGesture {
                                        if !vm.containsFurn(furn.rawValue) {
                                            vm.furnishings.append(furn)
                                        } else {
                                            vm.furnishings.removeAll { $0.rawValue == furn.rawValue }
                                        }
                                    }
                            }
                        }
                    }.padding(.horizontal,40)
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                        .fill(Color.white)
                        .padding(.horizontal)
                        .frame(width:390, height: 250)
                    VStack (alignment: .leading){
                        HStack{
                            Image(systemName: "square.resize")
                            Text("Property Size: \(size) ㎡")
                                .fontWeight(.medium)
                                .font(.title2)
                        }.offset(y:20)
                        Picker("Property Size", selection: $size) {
                            Text("Property Size: ㎡")
                            ForEach(Array(stride(from: 50, to: 201, by: 50)), id: \.self) { size in
                                Text("\(size)")
                            }
                        }.pickerStyle(.wheel)
                    }.padding(.horizontal,40)
                }
//                ZStack{
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
//                        .fill(Color.white)
//                        .padding(.horizontal)
//                        .frame(width:390, height: 200)
//                    VStack (alignment: .leading){
//                        Text("Amenities")
//                            .fontWeight(.medium)
//                            .font(.title2)
////                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 120))] ) {
////                            ForEach(Amenities.allCases, id: \.self) { amen in
////                                RoundedRectangle(cornerRadius: 5)
////                                    .fill(.gray2)
////                                    .stroke(vm.containsAmen(amen.rawValue) ? .darkPink : .gray2)
////                                    .frame(height: 50)
////                                    .overlay {
////                                        Text("\(amen.rawValue)")
////                                            .foregroundColor(vm.containsAmen(amen.rawValue) ? .accentColor : .black)
////                                    }
////                                    .onTapGesture {
////                                        if !vm.containsAmen(amen.rawValue) {
////                                            vm.amenities.append(amen)
////                                        } else {
////                                            vm.amenities.removeAll { $0.rawValue == amen.rawValue }
////                                        }
////                                    }
////                            }
////                        }
//
//                    }.padding(.horizontal,40)
//                }
                ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke( Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                                    .fill(Color.white)
                                    .padding(.horizontal)
                                    .frame(width:390, height: .infinity)
                                
                                VStack (alignment: .leading){
                                    Text("Amenities")
                                        .fontWeight(.medium)
                                        .font(.title2)
                                    
                                    // Check if amenities list needs to be expanded
                                    if isAmenitiesExpanded {
                                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 120))]) {
                                            ForEach(Amenities.allCases, id: \.self) { amen in
                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(.gray2)
                                                    .stroke(vm.containsAmen(amen.rawValue) ? .darkPink : .gray2)
                                                    .frame(height: 50)
                                                    .overlay {
                                                        Text("\(amen.rawValue)")
                                                            .foregroundColor(vm.containsAmen(amen.rawValue) ? .accentColor : .black)
                                                    }
                                                    .onTapGesture {
                                                        if !vm.containsAmen(amen.rawValue) {
                                                            vm.amenities.append(amen)
                                                        } else {
                                                            vm.amenities.removeAll { $0.rawValue == amen.rawValue }
                                                        }
                                                    }
                                            }
                                        }
                                    } else {
                                        // Render only the first five amenities and a button to expand
                                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 120))]) {
                                            ForEach(Amenities.allCases.prefix(5), id: \.self) { amen in
                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(.gray2)
                                                    .stroke(vm.containsAmen(amen.rawValue) ? .darkPink : .gray2)
                                                    .frame(height: 50)
                                                    .overlay {
                                                        Text("\(amen.rawValue)")
                                                            .foregroundColor(vm.containsAmen(amen.rawValue) ? .accentColor : .black)
                                                    }
                                                    .onTapGesture {
                                                        if !vm.containsAmen(amen.rawValue) {
                                                            vm.amenities.append(amen)
                                                        } else {
                                                            vm.amenities.removeAll { $0.rawValue == amen.rawValue }
                                                        }
                                                    }
                                            }
                                        }
                                        
                                        // Button to toggle amenities list expansion
                                        Button(action: {
                                            isAmenitiesExpanded.toggle()
                                        }) {
                                            Text("Show More Amenities")
                                                .foregroundColor(.accentColor)
                                        }
                                    }
                                }.padding(.horizontal,40)
                            }
            }
        }
        HStack{
            Button{

            }label: {
                Text("Clear All")
                    .fontWeight(.medium)
            }
            .padding()
            
            Spacer()
            
            Button{
                dismiss()
            }label: {
                Text("Save Changes")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal,10)
            .padding(9)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(4)
            
        }
        .padding()
    }
}

#Preview {
    FilterView(vm: FilterViewModel())
}
