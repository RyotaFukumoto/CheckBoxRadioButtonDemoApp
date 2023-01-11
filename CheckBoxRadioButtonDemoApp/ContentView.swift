//
//  ContentView.swift
//  CheckBoxRadioButtonDemoApp
//
//  Created by ryota on 2023/01/11.
//

import SwiftUI



struct ContentView: View {
    @State var catToggle = false
    @State var dogToggle = false
    
    @State private var selectedIndex = 0

    private let selectNames = ["オス", "メス"]
    
    var body: some View {
        VStack {
            Spacer()
                    
            Toggle("Cat", isOn: $catToggle)
              .toggleStyle(CheckBoxToggleStyle())
            Toggle("Dog", isOn: $dogToggle)
              .toggleStyle(CheckBoxToggleStyle())

            Spacer()
                    
                ForEach(0..<selectNames.count, id: \.self, content: { index in
                    HStack {
                        Text(selectNames[index])
                        Image(systemName: selectedIndex == index ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(.blue)
                    }
                    .frame(height: 40)
                    .onTapGesture {
                        selectedIndex = index
                    }
                })
            Spacer()
                    
        }
        .padding()
    }
}

struct CheckBoxToggleStyle:ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        Button{
            configuration.isOn.toggle()
        } label: {
            HStack{
                configuration.label
                Spacer()
                Image(systemName: configuration.isOn
                      ? "checkmark.square.fill"
                      : "square")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
