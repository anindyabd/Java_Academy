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
skeleton_code: %Q{\n 
public class HelloWorld {

    public static void main(String[] args) {
        System.out.println(\"\");
    }

}},
            testcases: ["1","2","aa"],
            expectedresults: ["Hello World!\n","Hello World!\n","Hello World!\n"]
             )

Lesson.create(number: 2, name: "Variables", description: "Declaring variables in Java",
    instruction: %Q{A variable stores a piece of data, and gives it a specific name. In Java, when 
    we declare a variable, we also need to specify its type. For example, to declare a variable that holds the 
    string "Hello World", we would say: 
    String mystring = "Hello World!" 
    Other common variable types include int (for integer), char (for character), and several others.
    In the skeleton_code, we did not declare the type of myint. This will give us an error. Insert the right 
    type for myint! Also, remember that Java needs a semi colon after each statement!},
skeleton_code: %Q{\n 
public class Variable {

    public static void main(String[] args) {
        myint = 5
        System.out.println(myint);
    }

}}, testcases: ["5"], expectedresults: ["5\n"]) 



