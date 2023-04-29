//
//  LaunchRowViewModel.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Combine
import Foundation

class LaunchRowViewModel: ObservableObject {
    @Published var timeUntilLaunch = ""
    let launch: RocketLaunch
    let launchTime: String

    private var cancellables = Set<AnyCancellable>()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private let timeUntilLaunchFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        return formatter
    }()

    init(launch: RocketLaunch) {
        self.launch = launch
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        launchTime = dateFormatter.string(from: launch.net)
        updateTimeUntilLaunch()

        timer.sink { [weak self] _ in
            self?.updateTimeUntilLaunch()
        }
        .store(in: &cancellables)
    }

    private func updateTimeUntilLaunch() {
        let interval = launch.net.timeIntervalSince(.now)
        let prefix = interval < 0 ? "T+" : "T-"
        let formattedInterval = timeUntilLaunchFormatter.string(from: abs(interval))!
        
        timeUntilLaunch = "\(prefix) \(formattedInterval)"
    }
}
