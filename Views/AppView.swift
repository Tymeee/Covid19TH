//
//  AppView.swift
//  Covid19App
//
//  Created by E2318556 on 11/2/2565 BE.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(appsList, id: \.id) { apps in
                    AppOption(apps: apps)
                }
            }.navigationTitle("Apps")
                .accentColor(.black)
        }.listStyle(InsetGroupedListStyle())
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
