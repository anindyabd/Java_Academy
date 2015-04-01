require 'rails_helper'

RSpec.describe Lesson, type: :model do
  context "The submit_code method should work properly" do
    it "should return a valid response when given Hello World code" do
      code = "public class HelloWorld {
          public static void main(String[] args) {
              System.out.println(\"Hello World\");
          }
      }"
      testcases = ["a"]
      response = Lesson.submit_work(code,testcases)
      expect(response["message"][0]).to eq("Success")
    end
  end

  context "The check submission method should work properly" do
    it "should verify correct results for Hello World lesson" do

      Lesson.create(number: 1, name: "Hello World!", 
            description: "Printing strings in Java", 
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
      lesson1 = Lesson.find(1)
      code = "public class HelloWorld {
          public static void main(String[] args) {
              System.out.println(\"Hello World\");
          }
      }"
      sbm_result = lesson1.check_submission(code)
      expect(sbm_result[:testspassed]).to eq([true, true,true])
    end
  end

end
