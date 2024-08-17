//
//  TabItem.swift
//  Finance Tracker
//
//  Created by Batuhan Berk Ertekin on 31.07.2024.
//

import Foundation

enum TabItem: String {
    case reminders = "TAB_REMINDERS"
    case home = "TAB_HOME"
    case coins = "TAB_COINS"
    case categories = "TAB_CATEGORIES"
    case calendar = "Calendar"

    var imageName: String {
        switch self {
        case .reminders:
            return "calendar.badge.plus"
        case .home:
            return "homekit"
        case .calendar:
            return "doc.text.magnifyingglass"
        case .coins:
            return "bitcoinsign.circle"
        case .categories:
            return "list.clipboard.fill"
        }
    }
    
    var title: String {
        switch self {
        case .reminders:
            return NSLocalizedString("TAB_REMINDERS_TITLE", comment: "")
        case .home:
            return NSLocalizedString("TAB_HOME_TITLE", comment: "")
        case .calendar:
            return NSLocalizedString("Genel Bakış", comment: "")
        case .coins:
            return NSLocalizedString("TAB_COINS_TITLE", comment: "")
        case .categories:
            return NSLocalizedString("TAB_CATEGORIES_TITLE", comment: "")
        }
    }

}

