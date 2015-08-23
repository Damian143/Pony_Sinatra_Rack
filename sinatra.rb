require "sinatra"
require "pony"

get '/' do
  send_file File.join(settings.public_folder, "index.html")
end

post "/contact" do

Pony.mail({
  :to => 'damianirarrazavalb@gmail.com',
  :from => params[:from],
  :body => params[:message],
  :subject => "#{params[:name]} #{params[:phone]}",
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'damianirarrazavalb@gmail.com',
    :password             => 'wzmrwnxdmcuestvf',
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
  }
})

  file_blank = open("contact_list.txt", "a")
  inputs = params[:name], params[:from], params[:phone], params[:message]
  file_blank.write(inputs)

	redirect to("/")

end

