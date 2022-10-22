package com.example.tienda
/*
class listHandler {


    constructor()

}
*/
class ListHandler {
    companion object {
        private var instance: ListHandler? = null
        @JvmName("getInstance1")
        fun getInstance(): ListHandler? {
            if (instance == null) {
                instance = ListHandler()
            }
            return instance
        }
    }
    private val lPrice = mutableListOf<Float>()
    private val lName = mutableListOf<String>()

    constructor()
    fun add(name: String, price: Float){
        lName.add(name)
        lPrice.add(price)
    }
    fun element(i: Int): String{
        val n = lName[i]
        val p = lPrice[i]
        return "$n - $p"
    }
    fun size(): Int{
        return lName.size
    }
}