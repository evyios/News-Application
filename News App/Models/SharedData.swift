//
//  SharedData.swift
//  News App
//
//  Created by Evgeny on 6.10.23.
//

import Foundation



class SharedData: ObservableObject {
    
    @Published var detailNews: News?
    @Published var showDetail: Bool = false
}
