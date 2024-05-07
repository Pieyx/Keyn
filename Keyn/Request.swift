//
//  Request.swift
//  Keyn
//
//  Created by Jood Khoja on 21/10/1445 AH.
//

import SwiftUI

struct Request: View {
    @State private var selection = 0

    var body: some View {
        

        ZStack { // Main ZStack
            Color(.background)
                .ignoresSafeArea(.all)
            VStack{
                Picker("Selection", selection: $selection) {
                    Text("Renter")
                        .tag(0)
                        .foregroundColor(.pink)
                    Text("Owner")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                ScrollView {
                    VStack {
                        if selection == 0 {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                                    .fill(Color.white)
                                    .padding(.horizontal)
                                    .frame(width: 390, height: 150)
                            }
                        } else if selection == 1 {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(hue: 1.0, saturation: 0.004, brightness: 0.921), lineWidth: 1)
                                    .fill(Color.white)
                                    .padding(.horizontal)
                                    .frame(width: 390, height: 150)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    Request()
}
