package com.blinkslabs.blinkist.android.challenge.ui

import androidx.test.espresso.action.ViewActions
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.matcher.ViewMatchers.*
import androidx.test.filters.LargeTest
import androidx.test.rule.ActivityTestRule
import androidx.test.runner.AndroidJUnit4
import assets.Command
import assets.selector
import assets.testBooks
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@LargeTest
@RunWith(AndroidJUnit4::class)
class BooksActivityTest {
    @Rule
    @JvmField
    var mActivityTestRule = ActivityTestRule(BooksActivity::class.java)


    //Test Page Assertions
    @Test
    fun testPageAssertions() {
        //Compensate for app load time as we are invoking a function at test start
        Thread.sleep(2000);

        //assert app navigation elements
        Command().assertLabel("YOUTUBE")
        Command().assertLabel("Blinkist Code Challenge")
        Command().assertBook(testBooks.idd241b2b.title, testBooks.idd241b2b.author)
    }

    //Test Book List
    @Test
    fun testBookList() {
        //Compensate for app load time as we are invoking a function at test start
        Thread.sleep(2000);

        //assert first book
        Command().assertBook(testBooks.idd241b2b.title, testBooks.idd241b2b.author)
        Command().tapBook(0)
        Command().assertPrompt("You clicked on the ${testBooks.idd241b2b.title}")
        Command().tapOkBtn()

        //assert mid-view book
        Command().assertBook(testBooks.id03779ee.title, testBooks.id03779ee.author)
        Command().tapBook(3)
        Command().assertPrompt("You clicked on the ${testBooks.id03779ee.title}")
        Command().tapOkBtn()

        //swipe down
        Command().swipeUp(50)

        //assert last book
        Command().assertBook(testBooks.id99c1c39.title, testBooks.id99c1c39.author)
        Command().tapBook(10)
        Command().assertPrompt("You clicked on the ${testBooks.id99c1c39.title}")
        Command().tapOkBtn()
    }

    //Test YouTube Play
    @Test
    fun testYoutubePlay() {
        //tap to open Youtube and assert webview
        Command().clickElement("Youtube")
        Command().assertLabel("Blinkist Code Challenge")
        selector.webView.check(matches(isDisplayed()))

        //navigate back and assert book list
        selector.navBackBtn.perform(ViewActions.click())
        Command().assertLabel("Blinkist Code Challenge")
    }
}
