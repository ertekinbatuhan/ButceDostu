//
//  CategoriesViewModel.swift
//  Finance Tracker
//
//  Created by Batuhan Berk Ertekin on 23.07.2024.
//

import Foundation
import SwiftUI
import SwiftData

protocol CategoriesViewModelProtocol {
    func fetchCategories(categories: [Category])
    func addNewCategory(context: ModelContext)
    func requestDeleteCategory(_ category: Category)
    func deleteCategory(context: ModelContext)
}

class CategoriesViewModel: ObservableObject, CategoriesViewModelProtocol {
    @Published var addCategory: Bool = false
    @Published var categoryName: String = ""
    @Published var deleteRequest: Bool = false
    @Published var requestedCategory: Category?
    @Published var allCategories: [Category] = []

    func fetchCategories(categories: [Category]) {
        allCategories = categories.sorted(by: { ($0.finances?.count ?? 0) > ($1.finances?.count ?? 0) })
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
            if let finances = requestedCategory.finances {
                for finance in finances {
                    context.delete(finance)
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
    
    func deleteFinance(_ finance: Finance, context: ModelContext) {
           context.delete(finance)
           do {
               try context.save()
           } catch {
               print("Error saving context after deleting finance: \(error)")
           }
       }
}
