//
//  ContentView.swift
//  DocumentPicker
//
//  Created by Taichi Uragami on 2021/12/28.
//

import SwiftUI

struct ContentView: View {
    @State private var fileName = ""
    @State private var showDocumentPicker = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text(fileName).fontWeight(.bold)
            Button(action:{showDocumentPicker.toggle()}){
                Text("Open")
            }
        }
        .fileImporter(isPresented: $showDocumentPicker, allowedContentTypes: [.text]) { (res) in
            do {
                let fileUrl = try res.get()
                print(fileUrl)
                self.fileName = fileUrl.lastPathComponent
            }
            catch {
                print("error reading files")
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
