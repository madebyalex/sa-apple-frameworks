//
//  FrameworkTitleView.swift
//  SA_Apple-Frameworks
//
//  Created by Alexander on 04.09.2021.
//

import SwiftUI

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70)
            
            Text(framework.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.7)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
    }
}

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}
