//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 郑伟 on 2019/7/24.
//  Copyright © 2019 BourbonZ. All rights reserved.
//

import SwiftUI

struct ChatMessage : Hashable {
    var message : String
    var avatar : String
    var color : Color
    var isMe : Bool
    
}

var messages = [
    ChatMessage(message: "Hello world", avatar: "A", color: .red, isMe: false),
    ChatMessage(message: "Hi", avatar: "B", color: .blue, isMe: false),
    ChatMessage(message: "Hello", avatar: "C", color: .yellow, isMe: true)

]

struct ChatRow : View {
    var chatMessage : ChatMessage
    var body: some View {
        Group {
            if !chatMessage.isMe {
                HStack {
                    Text(chatMessage.avatar)
                    Text(chatMessage.message)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(chatMessage.color, cornerRadius: 10)
                    Spacer()
                }
            } else {
                HStack {
                    Spacer()
                    Text(chatMessage.message)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(chatMessage.color, cornerRadius: 10)
                    Text(chatMessage.avatar)
                }
            }
        }
    }
    
    
}

struct ContentView : View {
    var body: some View {
        
        List {
            ForEach(messages.identified(by: \.self)) {
                ChatRow(chatMessage: $0)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
