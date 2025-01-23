//
//  AllEventsView.swift
//  eru_etkinlik
//
//  Created by şeyma gizem sivri on 11.12.2024.
//
import SwiftUI

struct AllEventsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(TripCards) { card in
                    Image(card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }
            }
            .padding()
        }
        .navigationTitle("Tüm Etkinlikler")
    }
}
