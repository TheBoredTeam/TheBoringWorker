//
//  SettingsView.swift
//  TheBoringWorker
//
//  Created by Richard Kunkli on 07/08/2024.
//

import KeyboardShortcuts
import LaunchAtLogin
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: BoringViewModel
    @State private var showBuildNumber: Bool = false
    
    var body: some View {
        TabView {
            General()
                .tabItem { Label("General", systemImage: "gear") }
                .tag(0)
            
            About()
                .tabItem { Label("About", systemImage: "info.circle") }
                .tag(1)
        }
        .formStyle(.grouped)
    }
    
    @ViewBuilder
    func About() -> some View {
        VStack {
            Form {
                Section {
                    LaunchAtLogin.Toggle()
                }
                
                Section {
                    HStack {
                        Text("Release name")
                        Spacer()
                        Text(vm.releaseName)
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Version")
                        Spacer()
                        if showBuildNumber {
                            Text("(\(Bundle.main.buildVersionNumber ?? ""))")
                                .foregroundStyle(.secondary)
                        }
                        Text(Bundle.main.releaseVersionNumber ?? "unkown")
                            .foregroundStyle(.secondary)
                            .onTapGesture {
                                withAnimation {
                                    showBuildNumber.toggle()
                                }
                            }
                    }
                } header: {
                    Text("Version info")
                }
            }
            Button("Quit boring.worker", role: .destructive) {
                exit(0)
            }
            .padding()
            Text("Made with 🫶🏻 by not so boring not.people")
                .foregroundStyle(.secondary)
                .padding(.bottom)
        }
    }
    
    @ViewBuilder
    func General() -> some View {
        Form {
            Section {
                Toggle("Show in menu bar", isOn: $vm.showMenuBarIcon)
            } header: {
                Text("System controls")
            }
        }
    }
    
    @available(macOS 14.0, *)
    func comingSoonTag() -> some View {
        Text("Coming soon")
            .foregroundStyle(.secondary)
            .font(.footnote.bold())
            .padding(.vertical, 3)
            .padding(.horizontal, 6)
            .background(Color(nsColor: .secondarySystemFill))
            .clipShape(.capsule)
    }
    
    @available(macOS 14.0, *)
    func customBadge(text: String) -> some View {
        Text(text)
            .foregroundStyle(.secondary)
            .font(.footnote.bold())
            .padding(.vertical, 3)
            .padding(.horizontal, 6)
            .background(RoundedRectangle(cornerRadius: 4).fill(Color(nsColor: .secondarySystemFill)))
    }
    
    func warningBadge(_ text: String, _ description: String) -> some View {
        Section {
            HStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 22))
                    .foregroundStyle(.yellow)
                VStack(alignment: .leading) {
                    Text(text)
                        .font(.headline)
                    Text(description)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
        }
    }
}
