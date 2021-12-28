//
//  DocumentPicker.swift
//  DocumentPicker
//
//  Created by Taichi Uragami on 2021/12/28.
//

import Foundation
import SwiftUI
import MobileCoreServices
//import UniformTypeIdentifiers

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var fileContent: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
        let controller: UIDocumentPickerViewController
        
        if #available(iOS 14, *) {
            controller = UIDocumentPickerViewController(forOpeningContentTypes: [.text], asCopy:  true)
        } else {
            controller = UIDocumentPickerViewController(documentTypes: [String(kUTTypeText)], in: .import)
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {}
    
}

class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate {
    
    @Binding var fileContent: String
    
    init(fileContent: Binding<String>) {
        _fileContent = fileContent
    }
    
    private func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt urls: [URL]) {
        let fileURL = urls[0]
        do {
            fileContent = try String(contentsOf: fileURL, encoding: .utf8)
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
}
