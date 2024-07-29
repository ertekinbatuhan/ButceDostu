//
//  CategoriesViewModel.swift
//  Finance Tracker
//
//  Created by Batuhan Berk Ertekin on 23.07.2024.
//

import Foundation
import SwiftUI
import SwiftData

class CategoriesViewModel: ObservableObject {
    @Published var addCategory: Bool = false
    @Published var categoryName: String = ""
    @Published var deleteRequest: Bool = false
    @Published var requestedCategory: Category?
    @Published var allCategories: [Category] = []

    func fetchCategories(categories: [Category]) {
        allCategories = categories.sorted(by: { ($0.expenses?.count ?? 0) > ($1.expenses?.count ?? 0) })
    }

    func addNewCategory(context: ModelContext) {
        let category = Category(categoryName: categoryName)
        context.insert(category)
        categoryName = ""
        addCategory = false
    }

    func requestDeleteCategory(_ category: Category) {
        deleteRequest.toggle()
        requestedCategory = category
    }

    func deleteCategory(context: ModelContext) {
        if let requestedCategory = requestedCategory {
            if let expenses = requestedCategory.expenses {
                for expense in expenses {
                    context.delete(expense)
                }
            }
            context.delete(requestedCategory)
            do {
                try context.save()
            } catch {
                print("Error saving context after deleting category: \(error)")
            }
            self.requestedCategory = nil
        }
    }

}
