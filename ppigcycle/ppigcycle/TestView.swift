//
//  TestView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/28.
//

import SwiftUI

struct TestView: View {
    
    @StateObject var barcode = RestAPI()
    @EnvironmentObject var vm: AppViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(barcode.posts, id: \.self) { result in
                    Text(result.goods_name)
                    Text(result.how)
                    Text(result.method)
                }
            }.navigationTitle("분리수거")
        }.onAppear(perform: {
            let parameter: [String: Any] = ["barcodeNumber" : vm.$recognizedItems]
            barcode.fetch(parameters: parameter)
        })
//        .onAppear {
//            barcode.fetch()
//        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
