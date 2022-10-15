package com.example.sqlite_1


import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper
import android.widget.Toast

val DATABASE_NAME = "UsuariosDB"
val TABLE_NAME = "Users"
val COL_NAME = "name"
val COL_AGE = "age"
val COL_ID = "ID"

class DatabaseHandler(var context: Context) : SQLiteOpenHelper(context, DATABASE_NAME, null, 1) {
    override fun onCreate(db: SQLiteDatabase?) {
        val createTable = "CREATE TABLE " + TABLE_NAME + " (" +
                COL_ID + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                COL_NAME + " VARCHAR(255)," +
                COL_AGE + " INTEGER)"

        db?.execSQL(createTable)
    }

    override fun onUpgrade(p0: SQLiteDatabase?, p1: Int, p2: Int) {
        TODO("Not yet implemented")
    }

    fun insertData(user: User) {
        val db = this.writableDatabase
        var cv = ContentValues()

        cv.put(COL_NAME, user.name)
        cv.put(COL_AGE, user.age)

        var result = db.insert(TABLE_NAME, null, cv)

        if(result == (-1).toLong())
            Toast.makeText(context, "Failed", Toast.LENGTH_SHORT).show()
        else
            Toast.makeText(context, "Success", Toast.LENGTH_SHORT).show()
    }

    fun readData(): MutableList<User> {
        var list: MutableList<User> = ArrayList()
        val db = this.readableDatabase
        val query = "Select * from " + TABLE_NAME;
        val result = db.rawQuery(query, null)
        if(result.moveToFirst()) {
            do {
                var user = User()
                user.id = result.getString(0).toInt()
                user.name = result.getString(1)
                user.age = result.getString(2).toInt()

                list.add(user)
            } while(result.moveToNext())
        }
        result.close()
        db.close()
        return list
    }
}