package com.example.tienda

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import java.io.Serializable

class Add : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add)

        val btnAdd = findViewById<Button>(R.id.button)
        val product = findViewById<EditText>(R.id.editTextTextPersonName)
        val price = findViewById<EditText>(R.id.editTextNumberDecimal)
        var c = 0
        val l = ListHandler.getInstance()

        var a = arrayListOf<String>()

        btnAdd.setOnClickListener {
            val name = product.text.toString()
            val p = price.text.toString()
            if(name.isNotEmpty() && p.isNotEmpty()) {
                val price = p.toFloat()
                l?.add(name, price)
                finish()
            } else {
                Toast.makeText(this, "Please fill all the fields", Toast.LENGTH_SHORT).show()
            }
        }
    }
}