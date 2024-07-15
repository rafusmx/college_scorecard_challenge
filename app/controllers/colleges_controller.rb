class CollegesController < ApplicationController
  CollegeData = Struct.new(:id, :name, :address, :city, :state, :zip)

  before_action :search_colleges, except: [:index, :show_map]

  def index; end

  def search
    render turbo_stream:
      turbo_stream.update("results_frame",
      partial: "colleges/index/college_list", locals: { search_metadata: @search_metadata, colleges: @colleges })
  end

  def show_map; end

  def show_more; end

  private

  def search_colleges
    request_data = External::CollegeScorecard.find_by_name(params["name"], params["page"])

    @search_metadata = request_data["metadata"]
    @search_metadata["name"] = params["name"]

    @colleges = request_data["results"].map do |data|
      CollegeData.new(id: data["id"],
                      name: data["school.name"],
                      address: data["school.address"],
                      city: data["school.city"],
                      state: data["school.state"],
                      zip: data["school.zip"])
    end
  end
end
