//
//  ChartViewModel.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

struct ChartViewModel {
    let data: [Int]
    
    var maxY: Int {
        data.max() ?? 0
    }
    var minY: Int {
        data.min() ?? 0
    }
    
    init(data: [Int]) {
        self.data = data
    }
}
