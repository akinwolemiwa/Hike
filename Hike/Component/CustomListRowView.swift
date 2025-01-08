//
//  CustomListRowView.swift
//  Hike
//
//  Created by DEV-AKIN on 1/8/25.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: - PROPERTIES
    
    @State var rowicons: String
    @State var rowlabel: String
    @State var rowContent: String? = nil
    @State var rowTintColour: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if(rowLinkLabel != nil && rowLinkDestination != nil ) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                
            }
            else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColour)
                    Image(systemName: rowicons)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
        
                Text(rowlabel)
            }
        }
    }
}

#Preview {
    List() {
        CustomListRowView(
            rowicons: "globe",
            rowlabel: "Website",
            rowContent: nil,
            rowTintColour: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "https://credo.academy"
            
            
        )
    }
}
