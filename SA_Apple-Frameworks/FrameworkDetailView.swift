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
            HStack {
                Spacer()
                
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding(.all, 20)
            
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
        
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
        
//        .fullScreenCover(isPresented: $isShowingSafariView, content: {
//            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
//        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
