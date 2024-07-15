class External::CollegeScorecard
  require 'rest-client'

  class << self
    def find_by_name(name, page=0)
      query_params = query_params_for(name: name, page: page)
      get_college_list(query_params)
    end

    private

    # API_KEY = ENV['SCORECARDAPIKEY']
    API_KEY = "CBAkXyPQ7SbR7a049z3UcxGSPnTiPUckadWdlcmt"
    BASE_URL = 'https://api.data.gov/ed/collegescorecard/v1/schools'.freeze # Included the endpoint since it is the only one to be used for the moment.


    def get_college_list(query_params)
      response = RestClient::Request.new(method: :get, url: url_string(query_params)).execute

      JSON.parse(response.to_s)
    end

    def url_string(query_params)
        "#{BASE_URL}?api_key=#{API_KEY}&#{query_params}&#{requested_fields}"
    end

    # In a more dynamic approach we may use.
    # def query_params_for(**data)
    # Propper validation of the data that can be used will be required.
    def query_params_for(name: nil, page: 0)
      return "school.name" if name.blank?

      "school.name=#{name}&page=#{page}"
    end

    # For the sake of clean code.
    # In a more dinamic approach we may consider a number of parameters that could be configured
    # to match the user needs.
    def result_fields
      %w[id school.name school.address school.city school.state school.zip]
    end

    def requested_fields
      "fields=#{result_fields.join(',')}"
    end
  end
end
