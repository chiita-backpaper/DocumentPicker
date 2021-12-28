//
//  ContentView.swift
//  DocumentPicker
//
//  Created by Taichi Uragami on 2021/12/28.
//

import SwiftUI

struct ContentView: View {
    @State private var fileContent = ""
    @State private var showDocumentPicker = false
    
    var body: some View {
        VStack {
            Text(fileContent).padding()
            
            Button("Import file") {
                showDocumentPicker = true
            }
        }
        .sheet(isPresented: self.$showDocumentPicker) {
            DocumentPicker(fileContent : $fileContent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
