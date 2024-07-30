//
//  FlyingNumber.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 29/07/24.
//

import SwiftUI

struct FlyingNumber: View {
    let number : Int
     
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

struct FlyingNumber_Previews: PreviewProvider {
    static var previews: some View {
        FlyingNumber(number: 5)
    }
}
