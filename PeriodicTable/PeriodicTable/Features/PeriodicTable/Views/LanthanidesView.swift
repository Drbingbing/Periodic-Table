//
//  LanthanidesView.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/24.
//

import SwiftUI

struct LanthanidesView: View {
    
    private var columns = (57...71).map { _ in GridItem(.fixed(80), spacing: 4) }
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(57...71, id: \.self) { _ in
                    ChemicalElementView(viewModel: ChemicalElementViewModel(atomicNumber: 12, symbol: "O", name: "氧", originalName: "Oxygen", category: "非金屬", hex: "FFFFFF"), onTap: {})
                }
            }
        }
    }
}

#Preview {
    LanthanidesView()
}
