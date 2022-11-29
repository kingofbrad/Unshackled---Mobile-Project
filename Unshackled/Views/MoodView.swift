//
//  MoodView.swift
//  Unshackled
//
//  Created by Bradlee King on 11/10/2022.
//

import SwiftUI

struct MoodView: View {
    
    @State var countries = [Country]()
    @State private var selectedCountry = "United Kingdom"
    
    var body: some View {
        NavigationView {
            List(countries, id: \.self) { country in
                HStack(spacing: 10) {
                    Text(country.name)
                        .bold()
                        .minimumScaleFactor(0.5)
                    Spacer()
                    Text(country.callingCodes)
                        .bold()
                        .foregroundColor(.gray)
                }
                
            }
            .onAppear() {
                getCountriesData()
                
            }.navigationTitle(Text("Countries"))
            
            
        }
    }
}
struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}


extension MoodView {
    func getCountriesData() {
        Network().getCountries { (result) in
            switch result {
            case .success(let countries):
                DispatchQueue.main.async {
                    self.countries = countries
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
