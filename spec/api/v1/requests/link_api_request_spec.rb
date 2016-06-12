require 'rails_helper'

RSpec.describe "GET /api/v1/links" do
  def parsed_response
    JSON.parse(response.body)
  end

  def format_date(date)
    date.strftime("%Y-%m-%dT%H:%M:%S.%LZ")
  end

  it "returns all links" do
    link1 = create(:link, title: "Test link 1", url: "http://www.exmample.com/1_link")
    link2 = create(:link, title: "Test link 2", url: "http://www.exmample.com/2_link")
    link3 = create(:link, title: "Test link 3", url: "http://www.exmample.com/3_link")

    get "/api/v1/links"

    expect(parsed_response.count).to eq(3)

    expect(parsed_response[0]).to eq({
      "id"=> link1.id,
      "url"=> link1.url,
      "title"=> link1.title,
      "read"=>false,
      "user_id"=>nil,
      "created_at"=> format_date(link1.created_at),
      "updated_at"=> format_date(link1.updated_at),
      })

    expect(parsed_response[1]["title"]).to eq(link2.title)
    expect(parsed_response[2]["title"]).to eq(link3.title)
  end

  it "returns one specific link" do
    link1 = create(:link, title: "Test link 1", url: "http://www.exmample.com/1_link")
    link2 = create(:link, title: "Test link 2", url: "http://www.exmample.com/2_link")
    link3 = create(:link, title: "Test link 3", url: "http://www.exmample.com/3_link")

    get "/api/v1/links/#{link1.id}"

    expect(parsed_response).to eq({
      "id"=> link1.id,
      "url"=> link1.url,
      "title"=> link1.title,
      "read"=>false,
      "user_id"=>nil,
      "created_at"=> format_date(link1.created_at),
      "updated_at"=> format_date(link1.updated_at),
      })

    expect(parsed_response).to_not include(link2.title)
    expect(parsed_response).to_not include(link3.title)
  end

  it "returns one specific link" do
    link1 = create(:link, title: "Test link 1", url: "http://www.exmample.com/1_link")
    link2 = create(:link, title: "Test link 2", url: "http://www.exmample.com/2_link")
    link3 = create(:link, title: "Test link 3", url: "http://www.exmample.com/3_link")

    get "/api/v1/links/#{link1.id}"

    expect(parsed_response).to eq({
      "id"=> link1.id,
      "url"=> link1.url,
      "title"=> link1.title,
      "read"=>false,
      "user_id"=>nil,
      "created_at"=> format_date(link1.created_at),
      "updated_at"=> format_date(link1.updated_at),
      })

    expect(parsed_response).to_not include(link2.title)
    expect(parsed_response).to_not include(link3.title)
  end

  it "creates a new link" do
    link1 = create(:link, title: "Test link 1", url: "http://www.exmample.com/1_link")
    new_link = {link: {
      title: "New Idea",
      url: "http://www.exmample.com/new_url",}
    }

    get "/api/v1/links/new", new_link

    expect(parsed_response["title"]).to eq(new_link[:link][:title])
  end

  it "updates an existing link" do
    link1 = create(:link, title: "Test link 1", url: "http://www.exmample.com/1_link")
    edited_link = {link: {
      title: "Edited Idea",
      url: "http://www.exmample.com/1_link",}
    }
    put "/api/v1/links/#{link1.id}", edited_link

    assert_response :success
  end
end
