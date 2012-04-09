config do
  boolean_true_values "true", "t", "1"
  boolean_false_values { |v| !(["true","t","1"].member? v) }
  date_time_format "%a %b %d %H:%M:%S %z %Y"
end

# :format in url will set "format" param
get "/users/show.:format" do
  # specified input
  input do
    # An Value type requires a contained value
    param "format", Value["json","xml"], { required: true }

    # required_without demands the presence of either "user_id" or "screen_name"
    param "user_id", Integer, { required_without: "screen_name" }
    # { case_sensitive: false } will downcase this field when running examples
    param "screen_name", String, { required_without: "user_id", case_sensitive: false }
    # default param values can be assigned and used when running examples
    param "include_entities", Boolean, { default: false }
  end

  # assured output
  output do
    # for now we're only supporting JSON
    # formats "json", "xml" => {"root" => "user"}

    value "id", Integer, { assured: true, matches_param: "user_id" }
    value "screen_name", String, { assured: true, matches_param: "screen_name" }
    value "status" do
      value "id", Integer, { assured: true }
      value "text", String, { assured: true }
      value "created_at", DateTime, { required: true }
      value "source", String
      # specify that "entities" will only be return if "include_entities" is true
      param "include_entities", true do
        value "entities" do
        end
      end
    end
  end

  # here's a runnable example
  # when we run the example server and hit the url with the following params
  # it will return the example output, in this case, coming from a file
  example "@TwitterApi JSON" do
    input do
      param "format", "json"
      param "screen_name", "TwitterApi"
      param "include_entities", "t"
    end
    output do
      content_from_file "resources/users-show-twitterapi.json"
    end
  end

  # with this catch all example, we return randomized output based on the
  # specified output and any overriding stuff in random_values
  example "Random output for other users" do
    output do
      random_values do
        # we can use bracketed syntax for inner params or values
        value "status[text]", random_web_sentence, { length: [50..140] }
      end
    end
  end

end

=begin
get "/statuses/home_timeline.:format" do
  input {
    session ["oauth","http_auth","cookie"], :required => true

    param "format", Value["json","xml"], { required: true }

    param "count", Integer, { default: 20 }
    param "since_id", Integer
    param "max_id", Integer
    param "page", Integer, { default: 1 }
    param "trim_user", Boolean, { default: false }
    param "include_rts", Boolean { default: false }
    param "include_entities", Boolean, { default: false }
    param "exclude_replies", Boolean, { default: false }
    param "contributor_details", Boolean, { default: false }
  }

  output {

  }
}
=end
