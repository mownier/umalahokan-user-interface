//
//  LoginModuleExtension.swift
//  UserInterface
//
//  Created by Mounir Ybanez on 06/05/2017.
//  Copyright © 2017 Ner. All rights reserved.
//

extension LoginModule {
    
    public class func create() -> LoginModule {
        let vc = LoginViewController()
        let module = LoginModule(scene: vc)
        module.presenter.scene = vc
        vc.presenter = module.presenter
        return module
    }
}
