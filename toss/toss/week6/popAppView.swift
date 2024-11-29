//
//  popAppView.swift
//  week7
//
//  Created by 어진 on 11/30/24.
//

import SwiftUI

struct AppItem: Identifiable {
    let id = UUID()
    let iconName: String
    let appName: String
    let description: String
    let buttonType: AppButtonType
}

enum AppButtonType {
    case download
}

struct AppListView: View {
    let apps: [AppItem] = [
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download),
        .init(iconName: "appIcon",
              appName: "토스",
              description: "금융이 쉬워진다",
              buttonType: .download)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(apps) { app in
                    AppItemView(item: app)
                }
            }
            .padding(20)
        }
    }
}

struct AppItemView: View {
    let item: AppItem

    var body: some View {
        HStack(spacing: 10) {
            appIcon
            appInfo
            Spacer()
            downloadButton
        }
        .frame(maxWidth: .infinity)
    }

    private var appIcon: some View {
        Image(item.iconName)
            .resizable()
            .frame(width: 70, height: 60)
    }

    private var appInfo: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(item.appName)
                .font(.system(size: 15, weight: .regular))
            Text(item.description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
    }
    
    private var downloadButton: some View {
        Image(systemName: "icloud.and.arrow.down")
    }
}


#Preview {
    AppListView()
}
