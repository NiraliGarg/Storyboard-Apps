//
//  ContentView.swift
//  SuryaNamaskar
//
//  Created by GEU on 10/02/26.
//

import SwiftUI

struct ContentView: View
{
    let suryaAsanas: [SuryaAsana] = [
            SuryaAsana(
                step: 1,
                asana: "Pranamasana",
                benefit: "Relaxes the nervous system and improves balance.",
                imageName: "1"
            ),
            SuryaAsana(
                step: 2,
                asana: "Hasta Uttanasana",
                benefit: "Stretches abdominal muscles and expands the chest.",
                imageName: "2"
            ),
            SuryaAsana(
                step: 3,
                asana: "Hasta Padasana",
                benefit: "Increases spine flexibility and stretches hamstrings.",
                imageName: "3"
            ),
            SuryaAsana(
                step: 4,
                asana: "Ashwa Sanchalanasana",
                benefit: "Stretches hip flexors and strengthens leg muscles.",
                imageName: "4"
            ),
            SuryaAsana(
                step: 5,
                asana: "Dandasana (Plank)",
                benefit: "Strengthens arms, back, and core.",
                imageName: "5"
            ),
            SuryaAsana(
                step: 6,
                asana: "Ashtanga Namaskara",
                benefit: "Develops chest and strengthens hands and wrists.",
                imageName: "6"
            ),
            SuryaAsana(
                step: 7,
                asana: "Bhujangasana",
                benefit: "Improves circulation and tones abdominal organs.",
                imageName: "7"
            ),
            SuryaAsana(
                step: 8,
                asana: "Parvatasana",
                benefit: "Strengthens shoulder muscles and nerves.",
                imageName: "8"
            ),
            SuryaAsana(
                step: 9,
                asana: "Ashwa Sanchalanasana",
                benefit: "Improves balance and stretches the lower body.",
                imageName: "9"
            ),
            SuryaAsana(
                step: 10,
                asana: "Hasta Padasana",
                benefit: "Massages digestive organs and improves metabolism.",
                imageName: "10"
            ),
            SuryaAsana(
                step: 11,
                asana: "Hasta Uttanasana",
                benefit: "Improves digestion and lung capacity.",
                imageName: "11"
            ),
            SuryaAsana(
                step: 12,
                asana: "Pranamasana",
                benefit: "Returns the body to a state of calm and centeredness.",
                imageName: "12"
            )
        ]
    var body: some View
    {
        TabView
        {
            NavigationStack
            {
                ScrollView
                {
                    ForEach(suryaAsanas, id:\.self)
                    {
                        asana in SuryaAsanaCard(asana: asana)
                    }
                }.navigationTitle("Surya Namaskar")
            }
            .tabItem
            {
                Label("Home", systemImage: "house")
            }
        }
    }
}
#Preview
{
    ContentView()
}
