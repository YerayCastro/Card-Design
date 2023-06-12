//
//  ContentView.swift
//  Diseno
//
//  Created by Yery Castro on 14/2/23.
//

import SwiftUI

struct ContentView: View {
    
    // Valores de entorno o enviromentValues
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            compactDesing()
        } else {
            regularDesing()
        }
    }
}

struct compactDesing: View {
    
    let numero = "100000000"
    let mensaje = "Hola como estás?"
    
    func sendMessage(){
        let sms = "sms:\(numero)&body=\(mensaje)"
        guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil)
    }
    
    func sendCall(){
        guard let number = URL(string: "tel://\(numero)") else { return }
        UIApplication.shared.open(number)
    }
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack() {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 100, weight: .bold))
                    Text("Maria Ramirez")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("Calle #123")
                        .font(.title)
                        .foregroundColor(.white)
                        .italic()
                HStack {
                    Button(action:{
                        sendCall()
                    }){
                        Image(systemName: "phone.fill")
                            .modifier(boton(color: .blue))
                    }
                    Button(action:{
                        sendMessage()
                    }){
                        Image(systemName: "message.fill")
                            .modifier(boton(color: .red))
                    }
                }
            }
        }
    }
}

struct boton: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
    }
}

struct regularDesing: View {
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            HStack {
                Image("icon")
                    .resizable()
                    .frame(width: 130, height: 100, alignment: .center)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10) {
                    Text("Maria Ramirez")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("Calle #123")
                        .font(.title)
                        .foregroundColor(.white)
                        .italic()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
