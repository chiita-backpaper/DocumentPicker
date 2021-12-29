//
//  LoadCSV.swift
//  DocumentPicker
//
//  Created by Taichi Uragami on 2021/12/29.
//

import Foundation
import SwiftCSV

func LoadCSV(url: URL) -> () {
    do {
        let csv = try CSV(url: url)
        print(csv.header)
        print(csv.namedRows)
        print(csv.namedColumns)
    } catch {
        print(error.localizedDescription)
    }
    
    //    return csvFile!
}
