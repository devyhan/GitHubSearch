//
//  RepositoryModule.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

let repository = module {
    single(tag: Repository.auth) { AuthRepository() as AuthDataSource }
    single(tag: Repository.book) { BookRepository() as BookDataSource }
    factory(tag: Repository.bookLocal) { BookLocalDataSource() as BookDataSource }
    factory(tag: Repository.bookRemote) { BookRemoteDataSource() as BookDataSource }
}
