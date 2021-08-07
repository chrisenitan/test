//
//  BooksService.swift
//  TestingChallenge
//
//  Created by Christian Lobach on 21.11.18.
//  Copyright © 2018 Blinks Labs GmbH. All rights reserved.
//

import Foundation


class BooksService {

    func getAllBooks(completion: @escaping ([Book]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            completion(self.books)
        }
    }

    private let books: [Book] = [
        Book(id: "d241b2b", name: "Eat, Move, Sleep", author: "Tom Rath", publishDate: dateFrom(year: 2018, month: 7, day: 3), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/5694b3802f6827000700002a/3_4/640.jpg")!),
        Book(id: "eea5ee1", name: "The Secret Life of Sleep", author: "Kat Duff", publishDate: dateFrom(year: 2018, month: 7, day: 2), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/56c1de12587c820007000063/3_4/640.jpg")!),
        Book(id: "7e2401d", name: "The Sleep Revolution", author: "Arianna Huffington", publishDate: dateFrom(year: 2018, month: 6, day: 19), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/5776159b86883200034f4744/3_4/640.jpg")!),
        Book(id: "03779ee", name: "Real Artists Don’t Starve", author: "Jeff Goins", publishDate: dateFrom(year: 2017, month: 12, day: 31), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/599817dbb238e10006a125cb/3_4/640.jpg")!),
        Book(id: "e021f6c", name: "Hirntuning", author: "Dave Asprey", publishDate: dateFrom(year: 2018, month: 1, day: 1), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/5b284d46b238e1000787b43d/3_4/640.jpg")!),
        Book(id: "8722651", name: "The Red Queen", author: "Matt Ridley", publishDate: dateFrom(year: 2018, month: 6, day: 17), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/58eb3b45a54bbb000464bab8/3_4/640.jpg")!),
        Book(id: "2cb8609", name: "Inner Engineering", author: "Sadhguru Jaggi Vasudev", publishDate: dateFrom(year: 2018, month: 6, day: 18), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/59751e00b238e100057032bf/3_4/640.jpg")!),
        Book(id: "b4388e4", name: "Feathers", author: "Thor Hanson", publishDate: dateFrom(year: 2018,month:  6, day: 18), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/59773cc1b238e10005084241/3_4/640.jpg")!),
        Book(id: "1cdb347", name: "The Subtle Art of Not Giving a F*ck", author: "Mark Manson", publishDate: dateFrom(year: 2016, month: 7, day: 2), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/592933bbb238e10007b6b0a5/3_4/640.jpg")!),
        Book(id: "a597717", name: "Bringing Up Bébé", author: "Pamela Druckerman", publishDate: dateFrom(year: 2016, month: 7, day: 3), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/57e6c3f0afd7bf0003b7052d/3_4/640.jpg")!),
        Book(id: "99c1c39", name: "A Book With a Very Long Title, Veeeeeeeeeeeeeeeeery Long, Possibly the Most Long Title For a Book You've Ever Seen In Your Entire Life", author: "The Blinkist Android Team", publishDate: dateFrom(year: 2014, month: 1, day: 1), coverImageUrl: URL(string: "https://images.blinkist.com/images/books/5575979e3935610007420000/3_4/640.jpg")!)
    ]

}

private func dateFrom(year: Int, month: Int, day: Int) -> Date {

    return Date()

}
