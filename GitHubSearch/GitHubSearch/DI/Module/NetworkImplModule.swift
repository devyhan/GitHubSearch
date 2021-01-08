//
//  NetworkImplModule.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

import Alamofire

let networkImpl = module {
    // Service
    factory { AFBookServiceImpl() as BookService }
    
    // Module
    single { Alamofire.Session.init(interceptor: resolve() as RequestInterceptor) }
    factory { AFRequestInterceptor() as RequestInterceptor }
}
