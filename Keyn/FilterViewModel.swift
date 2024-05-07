//
//  FilterViewModel.swift
//  Keyn
//
//  Created by Jood Khoja on 22/10/1445 AH.
//

import Foundation

class FilterViewModel: ObservableObject{
    @Published var rating: Int?
    @Published var propTypes: [PropTypes] = []
    @Published var pricePeriod: [PricePeriod] = []
}
extension FilterViewModel {
    func contatinsTypes(_ type: String)-> Bool {
        return propTypes.contains { $0.rawValue == type }
    }
    func containsPeriod(_ period: String)-> Bool {
        return pricePeriod.contains { $0.rawValue == period }
    }
}
