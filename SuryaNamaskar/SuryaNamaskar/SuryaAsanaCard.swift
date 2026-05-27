//
//  SuryaAsanaCard.swift
//  SuryaNamaskar
//
//  Created by GEU on 10/02/26.
//
import SwiftUI
struct SuryaAsanaCard: View
{
    let asana: SuryaAsana
    var body: some View
    {
        VStack
        {
            Image(asana.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                .shadow(radius: 10)
            Text("Step \(asana.step)")
                .font(.title)
            Text("\(asana.asana)")
                .font(.caption)
            Text(asana.benefit)
                .font(.caption)
        }
    }
}
