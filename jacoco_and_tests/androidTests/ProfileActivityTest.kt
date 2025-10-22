package com.example.myapplication

import android.app.Instrumentation
import android.bluetooth.BluetoothAdapter
import androidx.test.core.app.ActivityScenario
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.action.ViewActions.click
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.intent.Intents
import androidx.test.espresso.intent.Intents.intended
import androidx.test.espresso.intent.Intents.intending
import androidx.test.espresso.intent.matcher.IntentMatchers.hasAction
import androidx.test.espresso.intent.matcher.IntentMatchers.hasComponent
import androidx.test.espresso.matcher.ViewMatchers.withId
import androidx.test.espresso.matcher.ViewMatchers.withText
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.filters.LargeTest
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.FirebaseUser
import org.junit.After
import org.junit.Before
import org.junit.Ignore
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mockito

@RunWith(AndroidJUnit4::class)
@LargeTest
class ProfileActivityTest {

    @Before
    fun setup() {
        Intents.init()

        val mockAuth = Mockito.mock(FirebaseAuth::class.java)
        val mockUser = Mockito.mock(FirebaseUser::class.java)

        Mockito.`when`(mockAuth.currentUser).thenReturn(mockUser)
        Mockito.`when`(mockUser.email).thenReturn("test@example.com")

        AuthProvider.firebaseAuth = mockAuth
    }

    @After
    fun tearDown() {
        Intents.release()
    }

    @Test
    fun testEmailDisplayedWhenUserLoggedIn() {
        val scenario = ActivityScenario.launch(ProfileActivity::class.java)

        onView(withId(R.id.emailTv))
            .check(matches(withText("test@example.com")))

        scenario.close()
    }

    @Test
    fun testClickNotificationOpensNotificationActivity() {
        intending(hasComponent(NotificationActivity::class.java.name))
            .respondWith(Instrumentation.ActivityResult(0, null))

        val scenario = ActivityScenario.launch(ProfileActivity::class.java)

        onView(withId(R.id.notificationBtn)).perform(click())

        intended(hasComponent(NotificationActivity::class.java.name))

        scenario.close()
    }

    @Test
    fun testClickChatRequestsBluetoothDiscoverable() {
        intending(hasAction(BluetoothAdapter.ACTION_REQUEST_DISCOVERABLE))
            .respondWith(Instrumentation.ActivityResult(0, null))

        val scenario = ActivityScenario.launch(ProfileActivity::class.java)

        onView(withId(R.id.chatBtn)).perform(click())

        intended(hasAction(BluetoothAdapter.ACTION_REQUEST_DISCOVERABLE))

        scenario.close()
    }
}
