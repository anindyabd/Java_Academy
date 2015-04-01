class Lesson < ActiveRecord::Base
    has_many :records
    serialize :testcases
    serialize :expectedresults
    API_KEY = "hackerrank|204549-190|a37e68ec781f2525a479a5971c43772cb13b0013"

    def check_submission(code)
        # Submit the code for a lesson, returning a hash containing 
        # the following key. 
        # :testspassed  bool array showing whether test cases pass
        # :compiled?    false if compile error
        # :stdout       an array containing stdout of test cases
        # :stderr       an array containing stderr of test cases
        response = submit_work(code,self.testcases)
        
    end

    def self.submit_work(code, testcases)
        # Submit lesson via hackerrank API
        # See https://www.hackerrank.com/api/docs for details
        uri = URI("http://api.hackerrank.com/checker/submission.json")
        form = {"source" => code, 
                "lang" => 5, # Number code for Java is 3
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

    def self.test_submit
        submit_work('print 1', ["1"])
    end
  
end
