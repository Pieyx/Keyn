//
//  MyPropertiesView.swift
//  Keyn
//
//  Created by Jood Khoja on 26/10/1445 AH.
//

import SwiftUI

struct MyPropertiesView: View {
    @State private var firstName: String = ""
        @State private var lastName: String = ""
        @State private var email: String = ""
        @State private var phoneNumber: String = ""
    var body: some View {
        Form {
                    Section(header: Text("Personal Information")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    }

                    Section(header: Text("Contact Information")) {
                        TextField("Email", text: $email)
                        TextField("Phone Number", text: $phoneNumber)
                    }
        }.formStyle(.columns)
    }
}

#Preview {
    MyPropertiesView()
}
