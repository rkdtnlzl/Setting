//
//  SettingsItem.swift
//  Setting
//
//  Created by 강석호 on 7/20/24.
//

import Foundation

enum Section: String, CaseIterable {
    case allSettings = "전체 설정"
    case privateSettings = "개인 설정"
    case etcSettings = "기타"
}

struct SettingItem: Hashable {
    let title: String
    private let identifier = UUID()
}
