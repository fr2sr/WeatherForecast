//
//  WeatherHomeRouter.swift
//  WeatherForecast
//
//  Created by Sohanur Rahman on 2/6/23.
//

import Foundation
import UIKit

//typealias WeatherHomeEntryPoint = PresenterToRouterWeatherHomeProtocol & UIViewController


class WeatherHomeRouter: PresenterToRouterWeatherHomeProtocol{
    
       
    
    static func createModule() -> UINavigationController? {
        
        let viewcontroller = WeatherHomeViewController()
        let navigationController = UINavigationController(rootViewController: viewcontroller)
        let presenter: ViewToPresenterWeatherHomeProtocol & InteractorToPresenterWeatherHomeProtocol = WeatherHomePresenter()
        
        viewcontroller.presenter = presenter
        viewcontroller.presenter?.router = WeatherHomeRouter()
        viewcontroller.presenter?.view = viewcontroller
        viewcontroller.presenter?.interactor = WeatherHomeInteractor()
        viewcontroller.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func pushToSetting(on view: PresenterToViewWeatherHomeProtocol?) {
        if let settingsVC = SettingRouter.createModule() {
            let viewController = view as! WeatherHomeViewController
            viewController.navigationController?.pushViewController(settingsVC, animated: true)
        }
    }
}
