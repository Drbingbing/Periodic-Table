//
//  ChemicalElementDetailView.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/24.
//

import SwiftUI

struct ChemicalElementDetailView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
                ElementInformationView()
                ElementOverviewView()
                ElementDescriptionView()
                ElementPropertiesView()
                
                Color.clear.frame(height: 20)
            }
            .toolbarTitleDisplayMode(.inlineLarge)
        }
    }
}

private struct ElementInformationView: View {
    var body: some View {
        Grid(verticalSpacing: 0) {
            GridRow {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("資訊")
                    }
                    .padding(.horizontal, 4)
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(alignment: .bottom) {
                            Text("Hydrogen")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundStyle(Color.primaryApp)
                            Spacer()
                            Text("非金屬")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(.orange)
                        }
                        HStack {
                            Text("氫")
                                .font(.system(size: 48).bold())
                                .foregroundStyle(Color.primaryApp)
                            VStack(spacing: 0) {
                                Text("ㄑ")
                                Text("ㄧ")
                                Text("ㄥ")
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                HStack {
                                    Image(systemName: "scalemass")
                                    Text("1.00784–1.00811")
                                }
                                Text("族1")
                                Text("週期1")
                            }
                        }
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("外觀")
                    }
                    .padding(.horizontal, 4)
                    VStack(alignment: .leading) {
                        Image("Hydrogenglow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
}

private struct ElementOverviewView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "circle.hexagongrid")
                Text("概要")
                Spacer()
            }
            .padding(.horizontal, 4)
            .foregroundStyle(Color.primaryApp)
            .font(.body.weight(.medium))
            
            VStack(spacing: 20) {
                
                HStack {
                    Text("拉丁文名：")
                    Spacer()
                    Text("Hydrogenium")
                }
                
                Divider()
                
                HStack {
                    Text("英文名：")
                    Spacer()
                    Text("Hydrogen")
                }
                
                Divider()
                
                HStack {
                    Text("發現於：")
                    Spacer()
                    Text("1766")
                }
                
                Divider()
                
                HStack {
                    Text("CAS編號：")
                    Spacer()
                    Text("Hydrogenium")
                }
                
                Divider()
                
                HStack {
                    Text("發現者：")
                    Spacer()
                    Text("亨利.卡文迪什 (Henry Cavendish)")
                }
                
                Divider()
                
                HStack {
                    Text("每100克成本：")
                    Spacer()
                    Text("12 USD")
                }
                
                Divider()
                
                HStack {
                    Text("電子層：")
                    Spacer()
                    Text("K1-L0-M0-N0-O0-P0-Q0-R0")
                }
            }
            .padding(20)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}

private struct ElementDescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "doc.text")
                Text("說明")
                Spacer()
            }
            .padding(.horizontal, 4)
            .foregroundStyle(Color.primaryApp)
            .font(.body.weight(.medium))
            
            Text(
                "氫（拼音：qīnɡ，注音：ㄑ一ㄥ，粵拼：hing1，音同「輕」），是一種化學元素，化學符號為H，原子序數為1，原子量為1.00794 u是元素週期表中最輕的元素。單原子氫（H）是宇宙中最常見的化學物質，佔重子總質量的75%。電漿態的氫是主序星的主要成份。氫的最常見同位素是「氕」（此名稱甚少使用，符號為1H），含1個質子，不含中子；天然氫還含極少量的同位素「氘」（2H或D），其含1個質子和1個中子。\n\n氫原子最早在宇宙復合階段出現並遍佈全宇宙。在標準溫度和壓力之下，氫形成雙原子分子（俗稱氫氣，分子式為H2），呈無色、無臭、無味非金屬氣體，不具毒性，高度易燃。氫很容易和大部份非金屬元素形成共價鍵，所以地球上大部份的氫都以分子的形態存在，比如水和有機化合物等，但由於地球重力過小，無法留住氫氣，故地球上不存在自然的氫氣。氫在酸鹼反應中尤其重要，因為在這類反應中各種分子須互相交換質子。在離子化合物中，氫原子可以獲得一個電子成為氫陰離子（H-），或失去一個電子成為氫陽離子（H+）。雖然在一般寫法中，氫陽離子就是質子，但在實際化合物中，氫陽離子的實際結構是更為複雜的。氫原子是唯一一個有薛丁格方程式解析解的原子，[9]所以對氫原子模型的研究在量子力學的發展過程中起到了關鍵的作用。\n\n16世紀，人們通過混合金屬和強酸，首次製備出氫氣。1766至1781年，亨利·卡文迪什第一次發現氫氣是一種獨立的物質，燃燒後會產生水。1783年安東萬-羅倫·德·拉瓦節根據這一性質，將其命名為「Hydrogen」，以希臘文的「水」(hydro)與「產生」(genes)合成，意為「生成水的物質」，日文也翻譯為「水素」，即「生成水的元素」。19世紀50年代，英國醫生合信編寫《博物新編》（1855年）時，把元素名翻譯為「輕氣」，意旨「最輕的氣體」，成為今天中文「氫」字的來源。\n\n氫氣的工業生產主要使用天然氣的蒸汽重整過程，或通過能源消耗更高的水電解反應。大部份的氫氣都在生產地點直接使用，主要應用包括化石燃料處理（如裂化反應）和氨生產（一般用於化肥工業）。在冶金學上，氫氣會對許多金屬造成氫脆現象，使運輸管和儲存罐的設計更加複雜。"
            )
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}

private struct ElementPropertiesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "sun.min")
                Text("物理性質")
                Spacer()
            }
            .foregroundStyle(Color.primaryApp)
            .font(.body.weight(.medium))
            
            VStack(spacing: 20) {
                
                HStack {
                    Text("顏色")
                    Spacer()
                    Text("無色")
                }
                
                Divider()
                
                HStack {
                    Text("相：")
                    Spacer()
                    Text("氣體")
                }
                
                Divider()
                
                HStack {
                    Text("原子量(相對原子量)：")
                    Spacer()
                    Text("1.00797094202593(克/莫耳)")
                }
                
                Divider()
                
                HStack {
                    Text("密度：")
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("0°C, 101.325 帕斯卡")
                        Text("0.08988(克/立方公升)")
                    }
                }
                
                Divider()
                
                HStack {
                    Text("熔點：")
                    Spacer()
                    Text("13.99K  =  -259.16°C  =  -434.49°F")
                }
                
                Divider()
                
                HStack {
                    Text("沸點：")
                    Spacer()
                    Text("20.271K  =  -252.879°C  =  -423.182°F")
                }
                
                Divider()
                
                HStack {
                    Text("三相點")
                    Spacer()
                    Text("13.8033K  =  -259°C  =  7.041kPa")
                }
                
                Divider()
                
                HStack {
                    Text("臨界點")
                    Spacer()
                    Text("32.938K  =  1.2858MPa")
                }
                
                Divider()
                
                HStack {
                    Text("熔化熱")
                    Spacer()
                    Text("(H2) 0.117kJ.mol-1")
                }
                
                Divider()
                
                HStack {
                    Text("汽化熱")
                    Spacer()
                    Text("(H2) 0.904kJ.mol-1")
                }
                
                Divider()
                
                HStack {
                    Text("比熱容")
                    Spacer()
                    Text("(H2) 28.836 J.mol-1.K-1")
                }
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ChemicalElementDetailView()
}
