package assets

import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.recyclerview.widget.RecyclerView
import androidx.test.espresso.action.ViewActions
import androidx.test.espresso.contrib.RecyclerViewActions.actionOnItemAtPosition
import androidx.test.espresso.matcher.ViewMatchers
import com.blinkslabs.blinkist.android.challenge.R
import org.hamcrest.Description
import org.hamcrest.Matcher
import org.hamcrest.TypeSafeMatcher
import org.hamcrest.core.IsInstanceOf
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.matcher.ViewMatchers.*
import org.hamcrest.Matchers.allOf

//selectors
object selector {
    val webView = onView(
        allOf(
            withId(R.id.webview),
            withParent(withParent(withId(android.R.id.content))),
            isDisplayed()
        )
    )
    val navBackBtn = onView(
        allOf(
            withContentDescription("Navigate up"),
            isDisplayed()
        )
    )
}

class testBooks {
    object id99c1c39 {
        var title =
            "A Book With a Very Long Title, Veeeeeeeeeeeeeeeeery Long, Possibly the Most Long Title For a Book You've Ever Seen In Your Entire Life"
        var author = "The Blinkist Android Team"
    }

    object id03779ee {
        var title = "Real Artists Don’t Starve"
        var author = "Jeff Goins"
    }

    object idd241b2b {
        var title = "Eat, Move, Sleep"
        var author = "Tom Rath"
    }
}

class Command {
    fun assertPrompt(message: String) {
        val messageVal = onView(
            allOf(
                withId(android.R.id.message), withText(message),
                withParent(withParent(withId(R.id.scrollView))),
                isDisplayed()
            )
        )
        messageVal.check(matches(withText(message)))
    }

    fun assertBook(title: String, author: String) {
        //assert book title
        val titleVal = onView(
            allOf(
                withId(R.id.titleTextView), withText(title),
                withParent(withParent(IsInstanceOf.instanceOf(android.widget.LinearLayout::class.java))),
                isDisplayed()
            )
        )
        titleVal.check(matches(withText(title)))

        //assert book author
        val authorVal = onView(
            allOf(
                withId(R.id.authorTextView), withText(author),
                withParent(withParent(IsInstanceOf.instanceOf(LinearLayout::class.java))),
                isDisplayed()
            )
        )
        authorVal.check(matches(withText(author)))

    }

    fun assertLabel(ref: String) {
        val elReference = onView(
            allOf(
                withText(ref),
                isDisplayed()
            )
        )
        elReference.check(matches(withText(ref)))
    }

    fun clickElement(ref: String) {
        val elReference = onView(
            allOf(
                withText(ref),
                isDisplayed()
            )
        )
        elReference.perform(ViewActions.click())
    }

    fun tapBook(pos: Int) {
        val recyclerView = onView(
            allOf(
                withId(R.id.recyclerView),
                childAtPosition(
                    withId(R.id.swipeRefreshView),
                    0
                )
            )
        )
        recyclerView.perform(
            actionOnItemAtPosition<RecyclerView.ViewHolder>(
                pos, ViewActions.click()
            )
        )
    }

    fun tapOkBtn() {
        val appCompatButton = onView(
            allOf(
                withId(android.R.id.button1), ViewMatchers.withText("OK"),
                childAtPosition(
                    childAtPosition(
                        withId(R.id.buttonPanel),
                        0
                    ),
                    3
                )
            )
        )
        appCompatButton.perform(ViewActions.scrollTo(), ViewActions.click())
    }


    fun swipeUp(iteration: Int) {
        for (i in 0..iteration) {
            onView(
                allOf(
                    withId(R.id.titleTextView),
                    withText("The Red Queen")
                )
            ).perform(ViewActions.swipeUp())
        }
    }

    private fun childAtPosition(
        parentMatcher: Matcher<View>, position: Int
    ): Matcher<View> {

        return object : TypeSafeMatcher<View>() {
            override fun describeTo(description: Description) {
                description.appendText("Child at position $position in parent ")
                parentMatcher.describeTo(description)
            }

            public override fun matchesSafely(view: View): Boolean {
                val parent = view.parent
                return parent is ViewGroup && parentMatcher.matches(parent)
                        && view == parent.getChildAt(position)
            }
        }
    }
}
