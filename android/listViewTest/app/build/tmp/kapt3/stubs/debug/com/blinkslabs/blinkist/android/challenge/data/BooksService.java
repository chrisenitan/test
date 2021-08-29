package com.blinkslabs.blinkist.android.challenge.data;

import com.blinkslabs.blinkist.android.challenge.data.api.BooksApi;
import com.blinkslabs.blinkist.android.challenge.data.model.Book;
import io.reactivex.Single;
import javax.inject.Inject;

@kotlin.Metadata(mv = {1, 4, 0}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0012\u0010\u0005\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00070\u0006R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\t"}, d2 = {"Lcom/blinkslabs/blinkist/android/challenge/data/BooksService;", "", "booksApi", "Lcom/blinkslabs/blinkist/android/challenge/data/api/BooksApi;", "(Lcom/blinkslabs/blinkist/android/challenge/data/api/BooksApi;)V", "getBooks", "Lio/reactivex/Single;", "", "Lcom/blinkslabs/blinkist/android/challenge/data/model/Book;", "app_debug"})
public final class BooksService {
    private final com.blinkslabs.blinkist.android.challenge.data.api.BooksApi booksApi = null;
    
    @org.jetbrains.annotations.NotNull()
    public final io.reactivex.Single<java.util.List<com.blinkslabs.blinkist.android.challenge.data.model.Book>> getBooks() {
        return null;
    }
    
    @javax.inject.Inject()
    public BooksService(@org.jetbrains.annotations.NotNull()
    com.blinkslabs.blinkist.android.challenge.data.api.BooksApi booksApi) {
        super();
    }
}