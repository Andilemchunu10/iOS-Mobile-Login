//
//  ContentView.swift
//  My First App
//
//  Created by Andile Mchunu on 2023/05/17.
//

import SwiftUI

struct ContentView: View {
    @State private var displayText = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack (spacing: 30){
            
            Image(systemName: "pencil.and.outline").resizable().frame(width: 50.0, height: 50.0).imageScale(.small).foregroundColor(.accentColor)

            TextField(/*@START_MENU_TOKEN@*/"Username"/*@END_MENU_TOKEN@*/, text: $username).padding(.horizontal,100)
            
            SecureField("Password", text: $password).padding(.horizontal,100)

            Button(action: {
                if isValidPassword(password) {
                                displayText = "It is nice to see you"
                            } else {
                                displayText = "Please check your Password"
                            }
                displayText = "It is nice to see you"
            }) {
                Text("Login")
            }
        
            Text(displayText)
                .padding()
        }
    }
}
func isValidPassword(_ password: String) -> Bool {
    // Check if password has at least 8 characters
    guard password.count >= 8 else {
        return false
    }
    let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return passwordPredicate.evaluate(with: password)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
