//
//  HomeVM.swift
//  News App
//
//  Created by Evgeny on 21.09.23.
//

import Foundation
import Combine

class HomeVM: ObservableObject {
    
    @Published var news: [News] = []
    
    private let dataService = NewsDataService()
    private var cancallables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$news
            .sink { [weak self] returnedNews in
                self?.news = returnedNews
            }
            .store(in: &cancallables)
    }
}
