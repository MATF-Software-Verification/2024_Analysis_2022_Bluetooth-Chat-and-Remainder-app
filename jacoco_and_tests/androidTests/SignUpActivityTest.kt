package com.example.myapplication

import androidx.test.core.app.ActivityScenario
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.action.ViewActions.*
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.matcher.ViewMatchers.*
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.filters.LargeTest
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
@LargeTest
class SignUpActivityTest {

    private var scenario: ActivityScenario<SignUpActivity>? = null

    @Before
    fun setup() {
        scenario = ActivityScenario.launch(SignUpActivity::class.java)
    }

    @After
    fun tearDown() {
        scenario?.close()
    }

    @Test
    fun testInvalidEmailShowsError() {
        onView(withId(R.id.emailEt))
            .perform(typeText("invalidEmail"), closeSoftKeyboard())

        onView(withId(R.id.passwordEt))
            .perform(typeText("123456"), closeSoftKeyboard())

        onView(withId(R.id.SignUpBtn))
            .perform(click())

        onView(withId(R.id.emailEt))
            .check(matches(hasErrorText("Invalid format")))
    }

    @Test
    fun testEmptyPasswordShowsError() {
        onView(withId(R.id.emailEt))
            .perform(typeText("test@example.com"), closeSoftKeyboard())

        onView(withId(R.id.passwordEt))
            .perform(clearText(), closeSoftKeyboard())

        onView(withId(R.id.SignUpBtn))
            .perform(click())

        onView(withId(R.id.passwordEt))
            .check(matches(hasErrorText("You must enter password!")))
    }

    @Test
    fun testShortPasswordShowsError() {
        onView(withId(R.id.emailEt))
            .perform(typeText("test@example.com"), closeSoftKeyboard())

        onView(withId(R.id.passwordEt))
            .perform(typeText("123"), closeSoftKeyboard())

        onView(withId(R.id.SignUpBtn))
            .perform(click())

        onView(withId(R.id.passwordEt))
            .check(matches(hasErrorText("Password must contain at least 6 characters!")))
    }
}
