//
//  ContentView.swift
//  FirstProject
//
//  Created by naeem alabboodi on 8/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Hello, world!")
<<<<<<< HEAD
=======
            Image("flag")
                .resizable()
                .scaledToFill()
                .frame(width: 200,height: 200)
                .clipped()
              
                .overlay {
                    RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                        .stroke(lineWidth: 4)
                        .foregroundColor(.red)
                }
               
                
>>>>>>> 2a80238 (first Commit)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
