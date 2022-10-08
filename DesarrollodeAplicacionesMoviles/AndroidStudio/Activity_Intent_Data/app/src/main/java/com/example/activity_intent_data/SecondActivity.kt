package com.example.activity_intent_data

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class SecondActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)

        val txtValues = findViewById<TextView>(R.id.txtValues)

        val name = intent.getStringExtra("NAME")
        val age = intent.getIntExtra("AGE", 0)
        val country = intent.getStringExtra("COUNTRY")

        val personString = "$name is $age years old and lives in $country"

        txtValues.text = personString
    }
}