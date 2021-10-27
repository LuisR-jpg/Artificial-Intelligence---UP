## Trying Mongo in console.

```
show dbs 
use mydb
show collections //What I have in my db
db.COLLECTION_NAME.find() //Prints what the collection has
db.COLLECTION_NAME.drop() //Delete the collection

db.dogs.insertOne()
db.dogs.insertMany()
db.dogs.find()
db.dobs.find().pretty()
db.dogs.find({breed: "Corgi"})
db.dogs.insert({name: "Slinky", breed: "Salchicha", size: "medium", famous: true: age: 20, born: new Date("12/12/1996"})
db.dogs.deleteOne({name: "Max"}) //borra 1
db.dogs.deleteMany({name: "Max"}) //Borra varios
db.dogs.updateOne({name: "Slinky"}, {$set: {name: "Max", born: new Date()}})

```