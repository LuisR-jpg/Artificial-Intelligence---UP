package com.example.tienda

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btnAdd = findViewById<Button>(R.id.buttonAdd)
        val btnShow = findViewById<Button>(R.id.buttonShow)

        btnAdd.setOnClickListener {
            Intent(this, Add::class.java).also {
                startActivity(it)
            }
        }
        btnShow.setOnClickListener {
            Intent(this, Show::class.java).also {
                startActivity(it)
            }
        }
    }
}