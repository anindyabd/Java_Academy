require 'net/http'
require 'uri'
require 'json'

module LessonsHelper
    # Submit lesson via hackerrank API
    # See https://www.hackerrank.com/api/docs for details

    HACKERRANK_API_KEY = "hackerrank|204549-190|a37e68ec781f2525a479a5971c43772cb13b0013"

    def submit_work(code, testcases)
        uri = URI("http://api.hackerrank.com/checker/submission.json")
        form = {"source" => code, "lang" => 5, "testcases" => testcases.to_json,
                "api_key" => "hackerrank|204549-190|a37e68ec781f2525a479a5971c43772cb13b0013",
                'format' => 'json'}
        
        response = Net::HTTP.post_form(uri, form)

    end

    def test_submit
        submit_work('print 1', ["1"])
    end
end
