//
//  DashboardStyle.swift
//  Covid19App
//
//  Created by E2318556 on 9/1/2565 BE.
//

import Foundation
import SwiftUI

extension Text {
    
    func DailyStatsStyle() -> some View {
        self
            .font(.system(size: 36))
            .fontWeight(.semibold)
            .animation(Animation.default)
    }
    
    func TotalStatsStyle() -> some View {
        self
            .font(.footnote)
            .fontWeight(.semibold)
            .animation(Animation.default)
    }
    
}
