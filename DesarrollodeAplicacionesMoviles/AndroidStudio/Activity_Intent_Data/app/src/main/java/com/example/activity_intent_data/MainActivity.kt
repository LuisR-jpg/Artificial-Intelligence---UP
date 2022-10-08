package com.example.activity_intent_data

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import android.widget.Button

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val txtName = findViewById<EditText>(R.id.txtName)
        val txtAge = findViewById<EditText>(R.id.txtAge)
        val txtCountry = findViewById<EditText>(R.id.txtCountry)
        val btnApply = findViewById<Button>(R.id.btnApply)

        btnApply.setOnClickListener {
            val name = txtName.text.toString()
            val age = txtAge.text.toString().toInt()
            val country = txtCountry.text.toString()

            Intent(this, SecondActivity::class.java).also {
                it.putExtra("NAME", name)
                it.putExtra("AGE", age)
                it.putExtra("COUNTRY", country)
                startActivity(it)
            }
        }
    }
}