package com.zhizuobiao.androidwithflutter

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.speech.tts.TextToSpeech
import androidx.annotation.NonNull
import androidx.fragment.app.FragmentManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    companion object{
        private const val TAG_FLUTTER_FRAGMENT = "flutter_fragment"
    }
    private var flutterFragment: FlutterFragment ?= null
    lateinit var flutterEngine: FlutterEngine
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine = FlutterEngine(this)
        flutterEngine.navigationChannel.setInitialRoute("one_page")
        flutterEngine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        )
        FlutterEngineCache.getInstance().put("engine_id",flutterEngine)
        setContentView(R.layout.activity_main)
        button1.setOnClickListener {
//            startActivity(FlutterActivity.withNewEngine().initialRoute("one_page").build(this))
            startActivity(FlutterActivity.withCachedEngine("engine_id").build(this))
        }

        //跳转到fragment
        val fragmentManager : FragmentManager = supportFragmentManager
        flutterFragment = fragmentManager.findFragmentByTag(TAG_FLUTTER_FRAGMENT) as FlutterFragment?
        if (flutterFragment == null) {
            val newFlutterFragment = FlutterFragment.withCachedEngine("engine_id").build<FlutterFragment>()
            flutterFragment = newFlutterFragment
            fragmentManager.beginTransaction().add(R.id.fragment_container,newFlutterFragment, TAG_FLUTTER_FRAGMENT).commit()
        }
    }

    override fun onPostResume() {
        super.onPostResume()
        flutterFragment!!.onPostResume()

    }

    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)
        if (intent != null) {
            flutterFragment!!.onNewIntent(intent)
        }
    }

    override fun onBackPressed() {
        super.onBackPressed()
        flutterFragment!!.onBackPressed()
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        flutterFragment!!.onRequestPermissionsResult(
                requestCode,
                permissions,
                grantResults
        )
    }

    override fun onUserLeaveHint() {
        super.onUserLeaveHint()
        flutterFragment!!.onUserLeaveHint()
    }

    override fun onTrimMemory(level: Int) {
        super.onTrimMemory(level)
        flutterFragment!!.onTrimMemory(level)
    }
}