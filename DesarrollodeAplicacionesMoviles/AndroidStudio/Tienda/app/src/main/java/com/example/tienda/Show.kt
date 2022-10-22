package com.example.tienda

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class Show : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_show)

        val txt = findViewById<TextView>(R.id.textView)
        var cad = ""
        var l = ListHandler.getInstance()
        val s = l?.size()
        for(i in 0 until s!!)
            cad = cad.plus(l?.element(i)).plus("\n")
        txt.text = cad
    }
}