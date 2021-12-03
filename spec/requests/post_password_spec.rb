require 'rails_helper'

describe "post valid/strong password", :type => :request do
  
  before do
    post '/api/v1/password_checker', params: { password: "Test164@valid"}
  end

  it 'returns that password is strong with 200 OK status' do
    expect(response).to have_http_status(:success)
  end

end

describe "post password without number", :type => :request do
  
  before do
    post '/api/v1/password_checker', params: { password: "Testokho@valid"}
  end

  it 'returns that password isnt strong with 400 Bad Request status' do
    expect(response).to have_http_status(:bad_request)
  end
  
end

describe "post password without upper case letter", :type => :request do
  
  before do
    post '/api/v1/password_checker', params: { password: "1467te3@124"}
  end

  it 'returns that password isnt strong with 400 Bad Request status' do
    expect(response).to have_http_status(:bad_request)
  end
  
end

describe "post password without lower case letter", :type => :request do
  
  before do
    post '/api/v1/password_checker', params: { password: "146A73@124"}
  end

  it 'returns that password isnt strong with 400 Bad Request status' do
    expect(response).to have_http_status(:bad_request)
  end
  
end

describe "post password without special character", :type => :request do
  
  before do
    post '/api/v1/password_checker', params: { password: "te2Te56891"}
  end

  it 'returns that password isnt strong with 400 Bad Request status' do
    expect(response).to have_http_status(:bad_request)
  end
  
end

describe "post password with less than 9 characters", :type => :request do
  
  before do
    post '/api/v1/password_checker', params: { password: "te2T@98"}
  end

  it 'returns that password isnt strong with 400 Bad Request status' do
    expect(response).to have_http_status(:bad_request)
  end
  
end

describe "post password with repeated character", :type => :request do
  
  before do
    post '/api/v1/password_checker', params: { password: "Test@22gofor"}
  end

  it 'returns that password isnt strong with 400 Bad Request status' do
    expect(response).to have_http_status(:bad_request)
  end
  
end