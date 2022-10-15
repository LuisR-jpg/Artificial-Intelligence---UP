package com.example.sqlite_1

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import org.w3c.dom.Text

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val context = this

        val btnInsert = findViewById<Button>(R.id.btnInsert)
        val btnRead = findViewById<Button>(R.id.btnRead)
        val etvName = findViewById<TextView>(R.id.etvName)
        val etvAge = findViewById<TextView>(R.id.etvAge)
        val tvResult = findViewById<TextView>(R.id.tvResult)

        var db = DatabaseHandler(context)

        btnInsert.setOnClickListener {
            if (etvName.text.toString().length > 0 &&
                    etvAge.text.toString().length > 0) {
                var user = User(etvName.text.toString(), etvAge.text.toString().toInt())
                db.insertData(user)
            }
            else {
                Toast.makeText(context, "Please fill all the fields", Toast.LENGTH_SHORT).show()
            }
        }

        btnRead.setOnClickListener {
            var data = db.readData()
            tvResult.text = ""
            for(i in 0..(data.size-1)){
                tvResult.append(data.get(i).id.toString() + " " + data.get(i).name + " " + data.get(i).age.toString() + "\n")
            }
        }
    }
}