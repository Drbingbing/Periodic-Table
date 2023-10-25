//
//  ChemicalElementView.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import SwiftUI

struct ChemicalElementView: View {
    var viewModel: ChemicalElementViewModel
    var category: ElementCategoryViewModel?
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 8) {
                HStack {
                    if viewModel.atomicNumber == 57 {
                        Text("57 ~ 71")
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                        Spacer()
                    }
                    else if viewModel.atomicNumber == 89 {
                        Text("89 ~ 103")
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                        Spacer()
                    }
                    else {
                        Text("\(viewModel.atomicNumber)")
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                        Spacer()
                        Text(viewModel.symbol)
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                    }
                }
                VStack(spacing: 4) {
                    if viewModel.atomicNumber == 57 {
                        Text("鑭系")
                            .font(.largeTitle)
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                        Text("Lanthanides")
                            .font(.system(size: 14))
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                            .minimumScaleFactor(0.6)
                            .frame(height: 20)
                    }
                    else if viewModel.atomicNumber == 89 {
                        Text("錒系")
                            .font(.largeTitle)
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                        Text("Actinides")
                            .font(.system(size: 14))
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                            .minimumScaleFactor(0.6)
                            .frame(height: 20)
                    }
                    else {
                        Text(viewModel.name)
                            .font(.largeTitle)
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                        Text(viewModel.originalName)
                            .font(.system(size: 14))
                            .foregroundStyle(isTransparent ? Color.secondary : Color.primaryText)
                            .minimumScaleFactor(0.6)
                            .frame(height: 20)
                    }
                }
            }
            .padding(8)
            .background(isTransparent ? Color.white : Color(hex: viewModel.hex))
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .buttonStyle(.plain)
        .shadow(radius: 2)
    }
    
    private var isTransparent: Bool {
        if category == nil {
            return false
        }
        
        return viewModel.category != category?.name
    }
}

#Preview {
    ChemicalElementView(
        viewModel: ChemicalElementViewModel(atomicNumber: 1, symbol: "O", name: "氧", originalName: "Oxygen", category: "非金屬", hex: "9FFFCB"),
        category: ElementCategoryViewModel(name: "非金屬", hex: "AADE4C"),
        onTap: {}
    )
    .frame(width: 80, height: 100)
}
