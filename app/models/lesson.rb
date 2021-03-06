class Lesson < ActiveRecord::Base
  has_many :records
  serialize :testcases
  serialize :expectedresults
  API_KEY = "hackerrank|204549-190|a37e68ec781f2525a479a5971c43772cb13b0013"
  HACKERRANK_URI = "http://api.hackerrank.com/checker/submission.json"

  def check_submission(code)
    response = Lesson.submit_work(code, self.testcases)
    return Lesson.test_response(response, self.testcases, self.expectedresults)
  end
  
  def self.compare_answers(answers, answer_keys)
    result = []
    answers.zip(answer_keys).each do |answer, key|
      result << (answer == key)
    end
    result
  end

  def self.test_response(response,testcases,expectedresults)
    # Verify the response of a submission against a lesson testcases
    # the following key. 
    # :testspassed      bool array showing whether test cases pass
    # :stdout           an array containing stdout of test cases
    # :stderr           an array containing stderr of test cases
    # :error            a string containing error with submission process
    #                   not to confuse with :stderr
    #
    # have to do this to facilitate cucumber testing 
    # this did not get coverage in cucumber or spec. Minh
    if expectedresults.instance_of? String 
      expectedresults = expectedresults.split(",") 
    end 
    result = {}
    num_tests = testcases.length
    if response == nil 
      # Error with HTTP POST
      result[:error] = "Error: could not submit code." 
    else
      # No error with HTTP, error within code still possible
      result[:stdout] = response["stdout"]
      result[:stderr] = response["stderr"]
      output = (result[:stdout].nil?) ? [] : result[:stdout]
      result[:testspassed] = compare_answers(output, expectedresults)
    end 

    return result
  end

  def self.submit_work(code, testcases)
    # Submit lesson via hackerrank API
    # See https://www.hackerrank.com/api/docs for details
    uri = URI(HACKERRANK_URI)

    # I have to do this to facilitate cucumber testing. Cucumber isn't 
    # allowing me to have testcases as an array, so I'm converting here.
    if testcases.instance_of? String 
      testcases = testcases.split(",") 
    end  

    form = {"source" => code, 
            "lang" => 3, # Number code for Java is 3
            "testcases" => testcases.to_json,
            "api_key" => API_KEY,
            'format' => 'json'}
        
    response = Net::HTTP.post_form(uri, form)
    if response.code == "200" # Valid response
      result = JSON.parse(response.body)["result"]
    else
      result = nil   
    end
  end

end
