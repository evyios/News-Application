//
//  NewsDataService.swift
//  News App
//
//  Created by Evgeny on 21.09.23.
//

import Foundation
import Combine



class NewsDataService: ObservableObject {
    
    @Published var news: [News] = []
    
    var newsSubscription: AnyCancellable?
    
    init() {
        getNews()
    }
    
     private func getNews() {
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles")
        else { return }
        
        newsSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> Data in
                guard let responce = output.response as? HTTPURLResponse,
                      responce.statusCode >= 200 && responce.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [News].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case . failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] returnedNews in
                self?.news = returnedNews
                self?.newsSubscription?.cancel()
            }

    }
}
