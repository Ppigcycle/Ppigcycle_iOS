//
//  BarcodeScanView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/28.
//

import SwiftUI

struct BarcodeScanView: View {

    @StateObject var barcode = RestAPI()
    @Binding var barcodeNumber: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(barcode.posts, id: \.self) { result in
                    HStack {
                        Text("제품명 - ")
                            .foregroundColor(.green)
                        Text(result.goods_name)
                    }
                    HStack {
                        Text("분리수거하는 방법 - ")
                            .foregroundColor(.green)
                        Text(result.how)
                    }
                    HStack {
                        Text("분리수거 분류 - ")
                            .foregroundColor(.green)
                        Text(result.method)
                    }
                }
            }.navigationTitle("분리수거하는 방법")
                .listStyle(PlainListStyle())
        }.onAppear(perform: {
            let parameter: [String: Any] = ["barcodeNumber" : barcodeNumber]
            barcode.fetch(parameters: parameter)
        })
    }
}

//struct Test_Previews: PreviewProvider {
//    static var previews: some View {
//        Test()
//    }
//}
