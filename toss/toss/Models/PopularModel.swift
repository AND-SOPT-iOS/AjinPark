//
//  PopularModel.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//

import UIKit

enum DownloadState {
    case installed
    case update
    case download
    case redownload
}

enum AppCategory: String {
    case entertainment = "엔터테인먼트"
    case socialNetworking = "소셜 네트워킹"
    case music = "음악"
    case shopping = "쇼핑"
    case utility = "유틸리티"
    case finance = "금융"
    case food = "푸드"
    case productivity = "생산성"
}

struct App {
    let iconImage: String
    let ranking: Int
    let title: String
    let subTitle: String
    let category: AppCategory
    let downloadState: DownloadState
    
    static let sampleApps: [App] = [
        App(
            iconImage: "1.png",
            ranking: 1,
            title: "Word",
            subTitle: "동영상과 음악을 스트리밍하세요",
            category: .entertainment,
            downloadState: .download
        ),
        App(
            iconImage: "tossIcon.png",
            ranking: 2,
            title: "토스",
            subTitle: "금융이 쉬워진다",
            category: .entertainment,
            downloadState: .download
        ),
        App(
            iconImage: "3.png",
            ranking: 6,
            title: "카카오톡",
            subTitle: "무료 메시징과 통화",
            category: .socialNetworking,
            downloadState: .download
        ),
        App(
            iconImage: "4.png",
            ranking: 4,
            title: "GoodNote6",
            subTitle: "사진과 동영상 공유",
            category: .socialNetworking,
            downloadState: .download
        ),
        App(
            iconImage: "5.png",
            ranking: 5,
            title: "Twitter",
            subTitle: "실시간 뉴스와 대화",
            category: .socialNetworking,
            downloadState: .download
        ),
        App(
            iconImage: "6.png",
            ranking: 3,
            title: "배고픈무지",
            subTitle: "음악 스트리밍 서비스",
            category: .music,
            downloadState: .download
        ),
        App(
            iconImage: "7.png",
            ranking: 7,
            title: "멜론",
            subTitle: "맛있다",
            category: .shopping,
            downloadState: .download
        ),
        App(
            iconImage: "8.png",
            ranking: 8,
            title: "라인",
            subTitle: "검색과 뉴스",
            category: .utility,
            downloadState: .download
        ),
        App(
            iconImage: "9.png",
            ranking: 9,
            title: "토스",
            subTitle: "간편 송금과 결제",
            category: .finance,
            downloadState: .download
        ),
        App(
            iconImage: "1.png",
            ranking: 10,
            title: "배달의민족",
            subTitle: "음식 배달 서비스",
            category: .food,
            downloadState: .download
        ),
        App(
            iconImage: "1.png",
            ranking: 11,
            title: "Discord",
            subTitle: "게이머를 위한 채팅",
            category: .socialNetworking,
            downloadState: .download
        ),
        App(
            iconImage: "1.png",
            ranking: 12,
            title: "Google",
            subTitle: "검색과 클라우드 서비스",
            category: .utility,
            downloadState: .download
        ),
        App(
            iconImage: "1.png",
            ranking: 13,
            title: "Facebook",
            subTitle: "친구와 소통하기",
            category: .socialNetworking,
            downloadState: .download
        ),
        App(
            iconImage: "1.png",
            ranking: 14,
            title: "LINE",
            subTitle: "무료 메시지와 통화",
            category: .socialNetworking,
            downloadState: .download
        ),
        App(
            iconImage: "1.png",
            ranking: 15,
            title: "Outlook",
            subTitle: "이메일과 캘린더",
            category: .productivity,
            downloadState: .download
        )
    ]
}
