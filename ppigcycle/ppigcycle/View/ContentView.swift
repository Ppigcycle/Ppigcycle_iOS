//
//  ContentView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//

import SwiftUI
import VisionKit

struct ContentView: View {
    
    @EnvironmentObject var vm: AppViewModel
    @StateObject var api = RestAPI()
    @State var barcodeNumber: String = ""
    @State var tag:Int? = nil
    
    var body: some View {
        switch vm.dataScannerAccessStatus {
        case .scannerAvailable:
            mainView
        case .cameraNotAvailable:
            Text("Your device doesn't have a camera")
        case .scannerNotAvailable:
            Text("Your device doesn't have support for scanning barcode with this app")
        case .cameraAccessNotGranted:
            Text("Please provide access to the camera in settings")
        case .notDetermined:
            Text("Requesting camera access")
        }
    }
    
    private var mainView: some View {
        DataScannerView(
            recognizedItems: $vm.recognizedItems,
            recognizedDataType: vm.recognizedDataType)
        .background { Color.gray.opacity(0.3) }
        .ignoresSafeArea()
        .id(vm.dataScannerViewId)
        .sheet(isPresented: .constant(true)) {
            bottomContainerView
                .background(.ultraThinMaterial)
                .presentationDetents([.medium, .fraction(0.25)])
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled()
                .onAppear {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
                        return
                    }
                    controller.view.backgroundColor = .clear
                }
        }
    }
    
    private var headerView: some View {
        VStack {
            Text(vm.headerText).padding(.top)
        }.padding(.horizontal)
    }
    
    private var bottomContainerView: some View {
        NavigationView {
            VStack {
                headerView
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(vm.recognizedItems) { item in
                            switch item {
                            case .barcode(let barcode):
                                
                                let barcodeNum = barcode.payloadStringValue ?? "Unknown"
                                Text(barcodeNum)
                                
                                NavigationLink(destination: BarcodeScanView(barcodeNumber: $barcodeNumber)
                                ,tag: 1, selection: self.$tag) {}
                                Button(action: {
                                    if barcodeNum != "" {
                                        barcodeNumber = barcodeNum
                                        self.tag = 1
                                    }
                                    else {
                                        Text("상품 정보를 찾을 수 없습니다.")
                                            .foregroundColor(Color.red)
                                    }
                                }) {
                                    Text("분리수거하는 방법")
                                        .foregroundColor(.green)
                                }
                                
                            @unknown default:
                                Text("Unknown")
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
