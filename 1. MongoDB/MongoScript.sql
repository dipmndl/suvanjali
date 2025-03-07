db.createUser(
   {
     user: "dip",
     pwd: "1234",
     roles: [ "readWrite", "dbAdmin" ]
   }
)
------------------------------
db.customers.insert
(
{
 first_name:"john",
 last_name:"doe",
 memberships: ["mem1", "mem2"],
 address:{
			street:"4 main st",
			city:"Boston"
			
		}
contacts:
		[
			{name:"Bred",relationship:"single"}
		]
}
)
---------------
db.createCollection("customers")
-------------------
show collections
-----------------
db.customers.insert({first_name:"john",last_name:"doe"})
-----------------
db.customers.find()
-------add multiple data into collections----------
db.customers.insert([{first_name:"dip",last_name:"mondal"},{first_name:"aditya",last_name:"roy",gender:"male"}])
--------------
> db.customers.find()
{ "_id" : ObjectId("5d1d7b6c74057ae9fa3cd087"), "first_name" : "john", "last_name" : "doe" }
{ "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"), "first_name" : "dip", "last_name" : "mondal" }
{ "_id" : ObjectId("5d1d7c2b74057ae9fa3cd089"), "first_name" : "aditya", "last_name" : "roy", "gender" : "male" }
---------------------------
> db.customers.find().pretty()
{
        "_id" : ObjectId("5d1d7b6c74057ae9fa3cd087"),
        "first_name" : "john",
        "last_name" : "doe"
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"),
        "first_name" : "dip",
        "last_name" : "mondal"
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd089"),
        "first_name" : "aditya",
        "last_name" : "roy",
        "gender" : "male"
}
---------Update customer john----------
db.customers.update({first_name:"john"},{first_name:"john",last_name:"sinha",gender:"male"})
 db.customers.update({first_name:"john"},{$set:{gender:'male'}})
 
 db.customers.update({first_name:"dip"},{$set:{age:25}})
 > db.customers.find().pretty()
{
        "_id" : ObjectId("5d1d7b6c74057ae9fa3cd087"),
        "first_name" : "john",
        "last_name" : "sinha",
        "gender" : "male"
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"),
        "first_name" : "dip",
        "last_name" : "mondal",
        "age" : 25
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd089"),
        "first_name" : "aditya",
        "last_name" : "roy",
        "gender" : "male"
{
The $inc operator increments a field by a specified value and has the following form:

{ $inc: { <field1>: <amount1>, <field2>: <amount2>, ... } }
> db.customers.update({first_name:"dip"},{$inc:{age:5}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.customers.find().pretty()
{
        "_id" : ObjectId("5d1d7b6c74057ae9fa3cd087"),
        "first_name" : "john",
        "last_name" : "sinha",
        "gender" : "male"
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"),
        "first_name" : "dip",
        "last_name" : "mondal",
        "age" : 30
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd089"),
        "first_name" : "aditya",
        "last_name" : "roy",
        "gender" : "male"
}
> db.customers.update({first_name:"aditya"},{$unset:{gender:""}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.customers.find().pretty()
{
        "_id" : ObjectId("5d1d7b6c74057ae9fa3cd087"),
        "first_name" : "john",
        "last_name" : "sinha",
        "gender" : "male"
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"),
        "first_name" : "dip",
        "last_name" : "mondal",
        "age" : 30
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd089"),
        "first_name" : "aditya",
        "last_name" : "roy"
}
>The $unset operator deletes a particular field. Consider the following syntax:

{ $unset: { <field1>: "", ... } }

 db.customers.update({first_name:"aditya"},{$unset:{gender:""}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.customers.find().pretty()
{
        "_id" : ObjectId("5d1d7b6c74057ae9fa3cd087"),
        "first_name" : "john",
        "last_name" : "sinha",
        "gender" : "male"
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"),
        "first_name" : "dip",
        "last_name" : "mondal",
        "age" : 30
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd089"),
        "first_name" : "aditya",
        "last_name" : "roy"
}
upsert is defined as operation that "creates a new document when no document matches the query criteria" 
there is no place for upsertsin insert command. It is an option for the update command.

db.customers.update({first_name:"sulekha"},{first_name:"sulekha",last_name:"mitra"},{upsert:true})
WriteResult({
        "nMatched" : 0,
        "nUpserted" : 1,
        "nModified" : 0,
        "_id" : ObjectId("5d1d9d9a8cd2a2ca0b30f27f")
})
> db.customers.find().pretty()
{
        "_id" : ObjectId("5d1d7b6c74057ae9fa3cd087"),
        "first_name" : "john",
        "last_name" : "sinha",
        "gender" : "male"
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"),
        "first_name" : "dip",
        "last_name" : "mondal",
        "age" : 30
}
{
        "_id" : ObjectId("5d1d7c2b74057ae9fa3cd089"),
        "first_name" : "aditya",
        "last_name" : "roy"
}
{
        "_id" : ObjectId("5d1d9d9a8cd2a2ca0b30f27f"),
        "first_name" : "sulekha",
        "last_name" : "mitra"
}
The $rename operator updates the name of a field and has the following form:

{$rename: { <field1>: <newName1>, <field2>: <newName2>, ... } }
db.customers.update({first_name:"sulekha"},{$rename:{"gender":"sex"}})

db.collection.remove()
Removes documents from a collection.
> db.customers.remove({first_name:"john"})

> db.customers.find({$or:[{first_name:"dip"},{first_name:"sulekha"}]})
{ "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"), "first_name" : "dip", "last_name" : "mondal", "age" : 30 }
{ "_id" : ObjectId("5d1d9d9a8cd2a2ca0b30f27f"), "first_name" : "sulekha", "last_name" : "mitra", "sex" : "female" }

$lte 
selects the documents where the value of the field is less than or equal to (i.e. <=) the specified value.
db.inventory.find( { qty: { $lte: 20 } } )
> db.customers.find({age:{$lte:30}})
{ "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"), "first_name" : "dip", "last_name" : "mondal", "age" : 30 }

$gte 
selects the documents where the value of the field is greater than or equal to (i.e. >=) a specified value (e.g. value.)
db.inventory.find( { qty: { $gte: 20 } } )
> db.customers.find({age:{$gte:10}})
{ "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"), "first_name" : "dip", "last_name" : "mondal", "age" : 30 }

> Find the collection where city is "boston"
> db.customers.find({"address.city":"boston"}).pretty()
{
        "_id" : ObjectId("5d1daae174057ae9fa3cd08a"),
        "first_name" : "john",
        "last_name" : "doe",
        "memberships" : [
                "mem1",
                "mem2"
        ],
        "address" : {
                "street" : "4th main",
                "city" : "boston"
        },
        "contacts" : [
                {
                        "name" : "Bred",
                        "relationship" : "single"
                }
        ]
}
> Sorting asending order
db.customers.find().sort({first_name:1}).pretty()
>Sorting decending order
> db.customers.find().sort({first_name:-1}).pretty()
Count the no
> db.customers.find({gender:"male"}).count()
Limit no of records to display
> db.customers.find().limit(2)
{ "_id" : ObjectId("5d1d7c2b74057ae9fa3cd088"), "first_name" : "dip", "last_name" : "mondal", "age" : 30 }
{ "_id" : ObjectId("5d1d7c2b74057ae9fa3cd089"), "first_name" : "aditya", "last_name" : "roy", "gender" : "male" }
>Print the customers first name
> db.customers.find().forEach(function(param){print("Customer Name is - " +param.first_name)})
Customer Name is - dip
Customer Name is - aditya
Customer Name is - sulekha
Customer Name is - john

-------------------Join two collections---------------
db.StudentScore.aggregate([{
    $lookup: {
            from: "StudentDepartments",
            localField: "_id",
            foreignField: "_id",
            as: "StudentDept"
        }
}])
