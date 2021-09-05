//
//  FrameworkDetailView.swift
//  SA_Apple-Frameworks
//
//  Created by Alexander on 04.09.2021.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            XDismissButton(isShowingDetailView: $isShowingDetailView)
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            ScrollView {
                Text(framework.description)
                    .font(.body)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
            }
            
            
            Spacer(minLength: 20)
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        
//        .sheet(isPresented: $isShowingSafariView, content: {
//            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
//        })
        
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}

//// Experiment
//struct StepperView: View {
//
//    @State private var value = 10
//    let step = 5
//    let range = 0...50
//
//    var body: some View {
//        Stepper(value: $value,
//                in: range,
//                step: step) {
//            Text("Current: \(value) in \(range.description) " + "stepping by \(step)")
//        }
//        .padding(10)
//    }
//}
