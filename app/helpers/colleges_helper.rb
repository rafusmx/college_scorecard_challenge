module CollegesHelper
  def gmap(college_data)

    content_tag(:iframe, nil, {width: "100%",
                height: "100%",
                frameborder: "0",
                style: "border:0",
                referrerpolicy: "no-referrer-when-downgrade",
                src: gmap_url(college_data),
                allowfullscreen: true})
  end

  def gmap_data_format(college_data)
    formated_str = college_data.name.gsub(/\s+/, "+")
    formated_str << ","
    formated_str << college_data.city.gsub(/\s+/, "+")
    formated_str << ","
    formated_str << college_data.state
    formated_str << ","
    formated_str << college_data.zip
    formated_str
  end

  def gmap_url(college_data)
    gmap_api_key = ENV["GOOGLEMAPSAPIKEY"]
    gmap_mode = "place"
    gmap_params = "q=#{college_data}"

    "https://www.google.com/maps/embed/v1/#{gmap_mode}?key=#{gmap_api_key}&#{gmap_params}"
  end
end
