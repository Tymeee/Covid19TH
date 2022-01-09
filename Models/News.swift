//
//  News.swift
//  Covid19App
//
//  Created by E2318556 on 9/1/2565 BE.
//

import Foundation
import SwiftUI

struct News: Identifiable {
    var id = UUID()
    var newsLogo: String
    var newsName: String
    var newsURL: String
}

var newsList = [News(newsLogo: "Thairath", newsName: "Thairath", newsURL: "https://www.thairath.co.th/timeline_corona"), News(newsLogo: "BangkokPost", newsName: "Bangkok Post", newsURL: "https://www.bangkokpost.com/specials/covid19/"), News(newsLogo: "DailyNews", newsName: "Daily News", newsURL: "https://www.dailynews.co.th/news/news_group/%E0%B8%A3%E0%B8%A7%E0%B8%A1%E0%B8%82%E0%B9%88%E0%B8%B2%E0%B8%A7%E0%B9%82%E0%B8%84%E0%B8%A7%E0%B8%B4%E0%B8%94-19/")]
