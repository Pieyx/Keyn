//
//  SwiftUIView.swift
//  Keyn
//
//  Created by Jood Khoja on 12/10/1445 AH.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        TabView {
            NavigationView {
                  ContentView()
              }
              .tabItem {
                Label("Keyn", systemImage: "house")
              }
            
            NavigationView {
                  Favorite()
              }
              .tabItem {
                Label("Favorite", systemImage: "heart")
              }
            NavigationView {
                  Request()
              }
              .tabItem {
                Label("Request", systemImage: "key")
              }
            NavigationView {
                Profile()
            }
            .tabItem {
              Label("Profile", systemImage: "person")
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
