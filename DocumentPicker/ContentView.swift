//
//  ContentView.swift
//  DocumentPicker
//
//  Created by Taichi Uragami on 2021/12/28.
//

// https://www.youtube.com/watch?v=tnOVnwbkAA0&t=38s

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State private var fileName = ""
    @State private var openFile = false
    @State private var saveFile = false
    
    let saveFilePath = Bundle.main.path(forResource: "sample", ofType: "csv")
    
    var body: some View {
        VStack(spacing: 25) {
            Text(fileName).fontWeight(.bold)
            Button(action:{openFile.toggle()}){
                Text("Open")
            }
            Button(action:{saveFile.toggle()}){
                Text("Save")
            }
        }
        .fileImporter(isPresented: $openFile, allowedContentTypes: [.text]) { (res) in
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
        
        .fileExporter(isPresented: $saveFile, document: Doc(url: saveFilePath ?? ""), contentType: .image) { (res) in do {
                let fileUrl =  try res.get()
                print(fileUrl)
            }
            catch {
                print("cant save image")
                print(saveFilePath ?? "nil")
                print(error.localizedDescription)
            }
            
        }
    }
}

struct Doc: FileDocument {
    var url: String
    static var readableContentTypes: [UTType]{[.image]}
    
    init(url: String) {
        self.url = url
    }
    
    init(configuration: ReadConfiguration) throws {
        url = ""
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let file = try! FileWrapper(url: URL(fileURLWithPath: url), options: .immediate)
        return file
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
