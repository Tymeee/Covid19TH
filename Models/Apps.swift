//
//  Apps.swift
//  Covid19App
//
//  Created by E2318556 on 11/2/2565 BE.
//

import Foundation
import SwiftUI

struct Apps: Identifiable {
    var id = UUID()
    var appsLogo: String
    var appsName: String
    var appsURL: String
}

var appsList = [Apps(appsLogo: "thaichana", appsName: "ไทยนะ", appsURL: "https://apps.apple.com/th/app/thaichana/id1514639877")]   
