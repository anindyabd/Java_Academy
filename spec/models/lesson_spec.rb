require 'rails_helper'

RSpec.describe Lesson, type: :model do
  context "the submit_code method" do
    code = "public class HelloWorld {
          public static void main(String[] args) {
              System.out.println(\"Hello World\");
          }
      }"
      
    it "should return a valid response when given Hello World code" do
      testcases = ["a"]
      response = Lesson.submit_work(code,testcases)
      expect(response["message"][0]).to eq("Success")
    end

    it "should return nil when response code is not 200" do
      testcases = 42    # Garbage input to get error response
                            # Hackerrank actually handle error in code
      response = Lesson.submit_work(code,testcases)
      expect(response).to eq(nil)
    end
  end

  context "the test_response method" do

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

    it "should verify correct results for a valid code" do
      response = Lesson.submit_work(code, lesson1.testcases)
      sbm_result = Lesson.test_response(response,lesson1.testcases,lesson1.expectedresults)
      expect(sbm_result[:testspassed]).to eq([true, true,true])
    end

    it "should return an error messages if the response is nil" do
      sbm_result = Lesson.test_response(nil,lesson1.testcases,lesson1.expectedresults)
      expect(sbm_result[:error]).to eq("Error: could not submit code.")
    end

    it "should recognize failed testcase" do
      new_expected_results = ["Hello World\n", "a" , "b"]
      response = Lesson.submit_work(code, lesson1.testcases)
      result = Lesson.test_response(response, lesson1.testcases,
                                    new_expected_results)
      expect(result[:testspassed]).to eq([true,false,false])
    end

    it "should accept testcases that are strings" do
      lesson1.testcases = "1,2,aa"
      response = Lesson.submit_work(code, lesson1.testcases)
      sbm_result = Lesson.test_response(response,lesson1.testcases,
                                        lesson1.expectedresults)
      expect(sbm_result[:testspassed]).to eq([true, true,true])
    end
  end
  
  context "the test_response method" do
    Lesson.create(number: 1, name: "Hello World!", 
            description: "Printing strings in Java", 
            instruction: "In Java, you can print to console by using the 
                        System.out.println call. Try printing the string
                        \"Hello World!\" to the screen by putting the right
                        parameter in the coding window.",
            skeleton_code: "public class HelloWorld {public static void main(String[] args) {System.out.println(\"Hello World\"); }}",
            testcases: ["1","2","aa"],
            expectedresults: ["Hello World\n","Hello World\n","Hello World\n"]
             )
    lesson1 = Lesson.find(1)
    code = "public class HelloWorld {
          public static void main(String[] args) {
              System.out.println(\"Hello World\");
          }
      }"

    it "should accept testcases and expected results as strings" do
      lesson1.expectedresults = "Hello World\n,Hello World\n,Hello World\n"
      response = Lesson.submit_work(code, lesson1.testcases)
      sbm_result = Lesson.test_response(response,lesson1.testcases,lesson1.expectedresults)
      expect(sbm_result[:testspassed]).to eq([true, true,true])

    end
  end

  context "the check_submission method" do
    Lesson.create(number: 1, name: "Hello World!", 
            description: "Printing strings in Java", 
            instruction: "In Java, you can print to console by using the 
                        System.out.println call. Try printing the string
                        \"Hello World!\" to the screen by putting the right
                        parameter in the coding window.",
            skeleton_code: "public class HelloWorld {public static void main(String[] args) {System.out.println(\"Hello World\"); }}",
            testcases: ["1","2","aa"],
            expectedresults: ["Hello World\n","Hello World\n","Hello World\n"]
             )
    lesson1 = Lesson.find(1)
    code = "public class HelloWorld {
          public static void main(String[] args) {
              System.out.println(\"Hello World\");
          }
      }"

 
    it "should work when called on an instance of Lesson class" do
    end
  end
end
