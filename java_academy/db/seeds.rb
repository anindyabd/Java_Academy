# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Lesson.create(number: 1, name: "Hello World!", description: "Printing strings in Java", 
              instruction: "In Java, you can print to console by using the 
                        System.out.println call. Try printing the string
                        \"Hello World!\" to the screen by putting the right
                        parameter in the coding window.",
            skeleton_code: "public class HelloWorld {

    public static void main(String[] args) {
        System.out.println(\"Hello World\");
    }

}",
            testcases: ["1","2","aa"],
            expectedresults: ["Hello World\n","Hello World\n","Hello World\n"]
             )


