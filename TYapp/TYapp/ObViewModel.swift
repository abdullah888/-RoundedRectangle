//
//  ObViewModel.swift
//  TYapp
//
//  Created by abdullah on 13/04/1444 AH.
//

import SwiftUI

class ObViewModel :ObservableObject{
    
    @Published var Object: [ObjectModel] = []
    @Published var name = ""
    @Published var pas1 = ""
    @Published var pas2 = ""
    
    
}
