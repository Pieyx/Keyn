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
    @Published var furnishings: [Furnishings] = []
    @Published var amenities: [Amenities] = []

}
extension FilterViewModel {
    func contatinsTypes(_ type: String)-> Bool {
        return propTypes.contains { $0.rawValue == type }
    }
    func containsPeriod(_ period: String)-> Bool {
        return pricePeriod.contains { $0.rawValue == period }
    }
    func containsFurn(_ furn: String)-> Bool {
        return furnishings.contains { $0.rawValue == furn }
    }
    func containsAmen(_ Amen: String)-> Bool {
        return amenities.contains { $0.rawValue == Amen }
    }
}



