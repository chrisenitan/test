package com.blinkslabs.blinkist.android.challenge.data.api;

import dagger.Binds;
import dagger.Module;

@kotlin.Metadata(mv = {1, 4, 0}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bg\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\'\u00a8\u0006\u0006"}, d2 = {"Lcom/blinkslabs/blinkist/android/challenge/data/api/BooksApiModule;", "", "bindsBooksApi", "Lcom/blinkslabs/blinkist/android/challenge/data/api/BooksApi;", "mockBooksApi", "Lcom/blinkslabs/blinkist/android/challenge/data/api/MockBooksApi;", "app_debug"})
@dagger.Module()
public abstract interface BooksApiModule {
    
    @org.jetbrains.annotations.NotNull()
    @dagger.Binds()
    public abstract com.blinkslabs.blinkist.android.challenge.data.api.BooksApi bindsBooksApi(@org.jetbrains.annotations.NotNull()
    com.blinkslabs.blinkist.android.challenge.data.api.MockBooksApi mockBooksApi);
}