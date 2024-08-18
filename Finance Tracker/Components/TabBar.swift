//
//  ContentView.swift
//  Finance Tracker
//
//  Created by Batuhan Berk Ertekin on 22.07.2024.
//

import SwiftUI
import AppTrackingTransparency

struct TabBar: View {
    
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            FinanceView(currentTab: $selectedTab).tag(TabItem.home).tabItem {
                Image(systemName: TabItem.home.imageName)
                Text(TabItem.home.title)
                
            }
            
            SummaryView().tag(TabItem.calendar).tabItem{
                Image(systemName: TabItem.calendar.imageName)
                Text(TabItem.calendar.title)
            }
            
            CalendarView().tag(TabItem.calendarSummary).tabItem{
                Image(systemName: TabItem.calendarSummary.imageName)
                Text("Tarihsel Bakış")
            }
            
            
            ReminderView().tag(TabItem.home).tabItem {
                Image(systemName: TabItem.reminders.imageName)
                Text(TabItem.reminders.title)
            }
            
       //     CoinsView().tag(TabItem.coins).tabItem {
         //       Image(systemName: TabItem.coins.imageName)
           //     Text(TabItem.coins.title)
           // }
            CategoriesView().tag(TabItem.categories).tabItem {
                Image(systemName: TabItem.categories.imageName)
                Text(TabItem.categories.title)
    
            }
        }.onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in })
        }  
    }
}

#Preview {
    TabBar()
}
