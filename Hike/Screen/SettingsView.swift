//
//  SettingsView.swift
//  Hike
//
//  Created by DEV-AKIN on 1/7/25.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK: - PROPERTIES
    
    private let alternateAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Campfire",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    ]
    var body: some View {
        List{
            //MARK: - SECTION HEADER
            
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading").font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike").font(.system(size: 66, weight: .black))
                        Text("Editors Choice").font(.system(size: 14, weight: .medium))
                    }
                    Image(systemName: "laurel.trailing").font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom)
                ).padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks").font(.title2).fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even beter once you are actually there. The hike that you hope to do again someday.\nFind the best day hikes in the app.").font(.footnote).italic()
                    
                    Text("Dust off the boots, it's time for a walk").fontWeight(.heavy).foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }//: HEADER
            .listRowSeparator(.hidden)
         
            
            //MARK: - SECTION ICONS
            
            Section(
                header: Text("alternate app icons")
               
            ){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack (spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button(action: {
                               print("Icon \(alternateAppIcons[item]) was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                                    error in
                                    if error != nil {
                                        print ("Failed \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print ("Success")
                                    }
                                }
                            }, label: {
                               Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                                    
                            }
                            )
                        }
                    }
                }.buttonStyle(.borderless)//SCROLL VIEW
                    .padding(.top, 12)
            Text("Choose your favourite appicon from the selection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)
            
            //MARK: - SECTION ABOUT
            Section(
                header: Text("about the app"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
             //1. Basic Label Content
            //LabeledContent("Application", value: "Hike")
                
            //2. Advanced Label Content
                CustomListRowView(rowicons: "apps.iphone", rowlabel: "Application", rowContent: "Hike", rowTintColour: .blue)
                CustomListRowView(rowicons: "info.circle", rowlabel: "Compatibility", rowContent: "iOS, iPadOS", rowTintColour: .red)
                CustomListRowView(rowicons: "swift", rowlabel: "Technology", rowContent: "Swift", rowTintColour: .orange)
                CustomListRowView(rowicons: "gear", rowlabel: "Version", rowContent: "1.0.0", rowTintColour: .purple)
                CustomListRowView(rowicons: "ellipsis.curlybraces", rowlabel: "Developer", rowContent: "Akin", rowTintColour: .mint)
                CustomListRowView(rowicons: "paintpalette", rowlabel: "Designer", rowContent: "R.P Udemy", rowTintColour: .pink)
                CustomListRowView(rowicons: "globe", rowlabel: "Website", rowTintColour: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
              
            }
        
        }//:List
     
    }
}

#Preview {
    SettingsView()
}
