// Generated by Dagger (https://dagger.dev).
package com.blinkslabs.blinkist.android.challenge.ui;

import dagger.MembersInjector;
import dagger.internal.InjectedFieldSignature;
import javax.inject.Provider;

@SuppressWarnings({
    "unchecked",
    "rawtypes"
})
public final class BooksActivity_MembersInjector implements MembersInjector<BooksActivity> {
  private final Provider<BooksViewModelFactory> booksViewModelFactoryProvider;

  public BooksActivity_MembersInjector(
      Provider<BooksViewModelFactory> booksViewModelFactoryProvider) {
    this.booksViewModelFactoryProvider = booksViewModelFactoryProvider;
  }

  public static MembersInjector<BooksActivity> create(
      Provider<BooksViewModelFactory> booksViewModelFactoryProvider) {
    return new BooksActivity_MembersInjector(booksViewModelFactoryProvider);
  }

  @Override
  public void injectMembers(BooksActivity instance) {
    injectBooksViewModelFactory(instance, booksViewModelFactoryProvider.get());
  }

  @InjectedFieldSignature("com.blinkslabs.blinkist.android.challenge.ui.BooksActivity.booksViewModelFactory")
  public static void injectBooksViewModelFactory(BooksActivity instance,
      BooksViewModelFactory booksViewModelFactory) {
    instance.booksViewModelFactory = booksViewModelFactory;
  }
}
