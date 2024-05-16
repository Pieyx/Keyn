//
//  AddPropertyView.swift
//  Keyn
//
//  Created by Jood Khoja on 26/10/1445 AH.
//

import SwiftUI
import UIKit
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
    @State private var fullName: String = ""
    @State private var nationalID: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    
    @State var city = "Select City"
    @State var province = "Select Province"

    let provinces = ["Makkah Province", "Eastern Province"]
    let cities = ["Jeddah", "Riyadh"]
    
    let genderTypes = ["Female", "Male"]
    @State var gender = "Select Gender"
    @State private var selectedDate = Date()
    @State private var showHomeView = false // State variable to control navigation
  var body: some View {
          ScrollView{
              ZStack{
                  Color(.background)
                      .ignoresSafeArea(.all)
                  VStack (alignment: .leading){
                      Text("Personal Information")
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
                              ZStack {
                                  RoundedRectangle(cornerRadius: 7)
                                      .stroke(Color.gray, lineWidth: 1)
                                  TextField("", text: $fullName)
                                      .frame(height: 40)
                                      .padding(.leading)
                              }
                              HStack{
                                  Text("Gender")
                                  Spacer()
                                  Picker(selection: $gender, label: Text("")) {
                                      ForEach(genderTypes, id: \.self) { gender in
                                          Text(gender).tag(gender)
                                      }
                                  }
                                  .pickerStyle(MenuPickerStyle())
                                  .foregroundColor(.gray)
                                  .frame(width: 150,height: 40, alignment: .leading)
                                  .background(
                                      RoundedRectangle(cornerRadius: 4)
                                          .stroke(Color.gray, lineWidth: 1)
                                          
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
                                      TextField("", text: $nationalID)
                                          .keyboardType(.numberPad)
                                          .frame(height: 40)
                                          .padding(.leading)
                                          .onChange(of: nationalID) { newValue in
                                              // Allow only digits and limit to 10 characters
                                              let filtered = newValue.filter { "0123456789".contains($0) }
                                              if filtered.count <= 10 {
                                                  nationalID = filtered
                                              } else {
                                                  nationalID = String(filtered.prefix(10))
                                              }
                                          }
                                  }
                                  
                                  
                                  ZStack {
                                      RoundedRectangle(cornerRadius: 7)
                                          .stroke(Color.gray, lineWidth: 1)
                                      TextField("", text: $phoneNumber)
                                          .keyboardType(.numberPad)
                                          .frame(height: 40)
                                          .padding(.leading)
                                          .onChange(of: phoneNumber) { newValue in
                                              // Allow only digits and limit to 10 characters
                                              let filtered = newValue.filter { "0123456789".contains($0) }
                                              if filtered.count <= 10 {
                                                  phoneNumber = filtered
                                              } else {
                                                  phoneNumber = String(filtered.prefix(10))
                                              }
                                          }
                                  }
                              }
                              Text("Email")
                              ZStack {
                                  RoundedRectangle(cornerRadius: 7)
                                      .stroke(Color.gray, lineWidth: 1)
                                  TextField("", text: $email)
                                      .frame(height: 40)
                                      .padding(.leading)
                              }
                              Divider()
                              Text("Address")
                                  .fontWeight(.semibold)
                              HStack{
                                  Text("Province")
                                  Text("City")
                                      .padding(.leading,140)
                              }.padding(.top,1)
                              HStack {
                                  Picker(selection: $province, label: Text("")) {
                                      ForEach(provinces, id: \.self) { prov in
                                          Text(prov).tag(prov)
                                      }
                                  }
                                  .pickerStyle(MenuPickerStyle())
                                  .foregroundColor(.gray)
                                  .frame(width: 190,height: 40, alignment: .leading)
                                  .background(
                                      RoundedRectangle(cornerRadius: 4)
                                          .stroke(Color.gray, lineWidth: 1)
                                          
                                  )
                                  Spacer()
                                  Picker(selection: $city, label: Text("")) {
                                      ForEach(cities, id: \.self) { city in
                                          Text(city).tag(city)
                                      }
                                  }
                                  .pickerStyle(MenuPickerStyle())
                                  .foregroundColor(.gray)
                                  .frame(width: 150,height: 40, alignment: .leading)
                                  .background(
                                      RoundedRectangle(cornerRadius: 4)
                                          .stroke(Color.gray, lineWidth: 1)
                                          
                                  )
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
          NavigationLink(destination: PropertyInfo(vm: FilterViewModel()), isActive: $showHomeView) {
              
          }
      }
  }

struct PropertyInfo: View {
    @State private var selection = 0

    @State private var street: String = ""
    @State private var streetShow: String = ""
    @State private var deedNumber: String = ""
    @State private var ageOfProp: String = ""
    @State private var sizeOfProp: String = ""
    @State private var levelNumber: String = ""
    @State private var living: String = ""
    @State var bedrooms: String = ""
    @State private var bathrooms: String = ""
    
    @State private var network: String = ""
    @State private var networks = ["STC", "Mobily", "Zain"]

    @State private var period: String = ""
    @State private var periods = ["Yearly","Monthly", "Daily"]
    @State var price: String = ""
    
    @State var city = ""
    @State var province = ""
    @State var district = ""

    let provinces = ["Jeddah", "Eastern Province"]
    let cities = ["Jeddah", "Riyadh"]
    let districts = ["Jeddah", "Riyadh"]
    
    @State private var showHomeView = false
    
    @StateObject private var vm: FilterViewModel
    init(vm: FilterViewModel){
        _vm = StateObject(wrappedValue: vm)
    }
    
    func calculatePhotoSlots() -> [String: Int] {
            var photoSlots: [String: Int] = [:]
            
            if let bedroomCount = Int(bedrooms) {
                photoSlots["bedroom"] = bedroomCount
            }
            if let bathroomCount = Int(bathrooms) {
                photoSlots["bathroom"] = bathroomCount
            }
            if let livingCount = Int(living) {
                photoSlots["living"] = livingCount
            }
            
            for amenity in Amenities.allCases {
                if vm.containsAmen(amenity.rawValue) {
                        photoSlots[amenity.rawValue] = 1
                }
            }
            
            return photoSlots
        }
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
                    Text("Property key")
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,5)
                    Form{
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Province")
                                Text("City")
                                    .padding(.leading,140)
                            }
                            HStack {
                                Picker(selection: $province, label: Text("")) {
                                    ForEach(provinces, id: \.self) { prov in
                                        Text(prov).tag(prov)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .foregroundColor(.gray)
                                .frame(width: 190,height: 40, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray, lineWidth: 1)
                                        
                                )
                                Spacer()
                                Picker(selection: $city, label: Text("")) {
                                    ForEach(cities, id: \.self) { city in
                                        Text(city).tag(city)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .foregroundColor(.gray)
                                .frame(width: 150,height: 40, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray, lineWidth: 1)
                                        
                                )
                            }
                            HStack{
                                Text("District")
                                Text("Street")
                                    .padding(.leading,70)
                                Spacer()
                                Text("Street show")
                                    
                            }
                            HStack{
                                Picker(selection: $district, label: Text("")) {
                                    ForEach(districts, id: \.self) { dist in
                                        Text(dist).tag(dist)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .foregroundColor(.gray)
                                .frame(width: 120,height: 40, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray, lineWidth: 1)
                                        
                                )
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $street)
                                        .frame(width:120,height: 40)
                                        .padding(.leading)
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $streetShow)
                                        .keyboardType(.numberPad)
                                        .frame(height: 40)
                                        .padding(.leading)
                                }
                            }
                            HStack{
                                Text("Deed Number")
                                Spacer()
                                Text("Age of Property")
                                
                                    
                            }
                            HStack{
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $deedNumber)
                                        .keyboardType(.numberPad)
                                        .frame(width:220,height: 40)
                                        .padding(.leading)
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $ageOfProp)
                                        .keyboardType(.numberPad)
                                        .frame(height: 40)
                                        .padding(.leading)
                                }
                            }
                            Divider()
                            Text("Property description")
                                .fontWeight(.semibold)
                                .padding(.bottom,5)
                            HStack{
                                Text("Size")
                                Spacer()
                                Text("Level number")
                                    .padding(.trailing,10)
                                Text("Network Coverage")
                                    
                            }
                            HStack{
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $sizeOfProp)
                                        .keyboardType(.numberPad)
                                        .frame(height: 40)
                                        .padding(.leading)
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $levelNumber)
                                        .keyboardType(.numberPad)
                                        .frame(height: 40)
                                        .padding(.leading)
                                }
                                Picker(selection: $network, label: Text("")) {
                                    ForEach(networks, id: \.self) { net in
                                        Text(net).tag(net)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .foregroundColor(.gray)
                                .frame(width: 140,height: 40, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray, lineWidth: 1)
                                        
                                )
                            }
                            HStack{
                                Text("Living room")
                                Spacer()
                                Text("Bedroom")
                                    .padding(.trailing,20)
                                Spacer()
                                Text("Bathroom")
                                Spacer()
                            }
                            HStack{
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $living)
                                        .keyboardType(.numberPad)
                                        .frame(height: 40)
                                        .padding(.leading)
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $bedrooms)
                                        .keyboardType(.numberPad)
                                        .frame(height: 40)
                                        .padding(.leading)
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("", text: $bathrooms)
                                        .keyboardType(.numberPad)
                                        .frame(height: 40)
                                        .padding(.leading)
                                }
                            }
                            Divider()
                            Text("Property Pricing")
                                .fontWeight(.semibold)
                                .padding(.bottom,5)
                            HStack{
                                Text("Property Price")
                                Spacer()
                                Text("Price Period")
                                    .padding(.trailing,50)
                            }
                            HStack{
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray, lineWidth: 1)
                                    TextField("SR", text: $price)
                                        .keyboardType(.numberPad)
                                        .frame(height: 40)
                                        .padding(.leading)
                                }
                                Picker(selection: $period, label: Text("")) {
                                    ForEach(periods, id: \.self) { period in
                                        Text(period).tag(period)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .foregroundColor(.gray)
                                .frame(width: 140,height: 40, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray, lineWidth: 1)
                                        
                                )
                            }
                            Divider()
                            Text("Property Amenities")
                                .fontWeight(.semibold)
                                .padding(.bottom,5)
                                    ForEach(Amenities.allCases, id: \.self) { amen in
                                        HStack{
                                            Image(systemName: vm.containsAmen(amen.rawValue) ?
                                                  "square.fill":"square")
                                            .foregroundColor(vm.containsAmen(amen.rawValue) ?
                                                             Color.accentColor:Color.black)
                                            .onTapGesture {
                                                if !vm.containsAmen(amen.rawValue) {
                                                    vm.amenities.append(amen)
                                                } else {
                                                    vm.amenities.removeAll() { $0.rawValue == amen.rawValue }
                                                }
                                            }
                            
                                            Text(amen.rawValue)
                                                .font(.title3)
                                        }
                                    }
                           
                        }
                    }
                    .formStyle(.columns)
                    .font(.callout)
                    Text("2/4")
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
                Text("Next")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal,10)
            .padding(9)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(4)
            
        }.padding(.trailing)
        .padding()
        NavigationLink(destination: AttachmentView(photoSlots: calculatePhotoSlots()), isActive: $showHomeView) {
            
        }

    }
}

struct AttachmentView: View {
    var photoSlots: [String: Int]
    @State private var selectedImages: [UIImage?]
    @State private var isImagePickerPresented = false
    @State private var selectedIndex: Int?

    @State private var showHomeView = false // State variable to control navigation

    init(photoSlots: [String: Int]) {
        self.photoSlots = photoSlots
        self._selectedImages = State(initialValue: Array(repeating: nil, count: photoSlots.values.reduce(0, +)))
    }

    var body: some View {
        ScrollView {
            ZStack {
                Color(.background)
                    .ignoresSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Attachments")
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack {
                        Text("All field marked with")
                        Text("*")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                        Text("are required")
                    }.fontWeight(.thin)
                    Divider()
                    ForEach(photoSlots.keys.sorted(), id: \.self) { key in
                        Text("\(key.capitalized) Attachments")
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                        ForEach(0..<photoSlots[key]!, id: \.self) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: 350, height: 40)
                                HStack {
                                    Button(action: {
                                        selectedIndex = index
                                        isImagePickerPresented = true
                                    }) {
                                        Text(selectedImages[index] == nil ? "Select Picture" : "Replace Picture")
                                            .padding(5)
                                            .background(Color.white)
                                            .font(.footnote)
                                            .overlay(
                                                Rectangle()
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                    }
                                    .padding(.leading, -80)
                                    if let image = selectedImages[index] {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 120, height: 30)
                                    } else {
                                        Text("No image")
                                            .foregroundColor(.gray)
                                            .frame(width: 120)
                                    }
                                }
                            }
                        }
                    }
                    Divider()
                    Text("3/4")
                        .foregroundColor(.gray)
                        .padding(.leading, 330)
                        .padding(.top)
                }.padding()
            }
            HStack {
                Spacer()
                Button {
                    showHomeView = true
                } label: {
                    Text("Next")
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 10)
                .padding(9)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(4)
            }
            .padding(.trailing)
            .padding()
            NavigationLink(destination: PolicyView(), isActive: $showHomeView) {
                EmptyView()
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImages: $selectedImages, selectedIndex: $selectedIndex)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage?]
    @Binding var selectedIndex: Int?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage, let selectedIndex = parent.selectedIndex {
                parent.selectedImages[selectedIndex] = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct PolicyView: View {
    
    var body: some View {
        ScrollView{
            ZStack{
                Color(.background)
                    .ignoresSafeArea(.all)
                VStack (alignment: .leading){
                    Text("Terms and Conditions")
                        .font(.title)
                        .fontWeight(.bold)
                        Text("Privacy Policy")
                        .fontWeight(.thin)
                    Divider()
                    Text("person log on this website and compliant to the Company's terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client's needs in respect of provision of the Company's stated services, in accordance with and subject to, prevailing law of af. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.")
                        .font(.body)
                    Text("Content Liability")
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    Text("We shall not be hold responsible for any content that appears on your App. You agree to protect and defend us against all claims that is rising on your App. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, .")
                        .font(.body)

                    Text("4/4")
                        .foregroundColor(.gray)
                        .padding(.leading,330)
                        .padding(.top)
                }.padding()
            }
        }
        HStack{
            Spacer()
            
            Button{
               
            }label: {
                Text("Save and Submit")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal,10)
            .padding(9)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(4)
            
        }.padding(.trailing)
        .padding()
    }
}


#Preview{
    PropertyInfo(vm: FilterViewModel())
}
