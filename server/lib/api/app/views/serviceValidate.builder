# encoding: UTF-8
xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.tag!("cas:serviceResponse", 'xmlns:cas' => "http://www.yale.edu/tp/cas") do
  if @success
    xml.tag!("cas:authenticationSuccess") do
      xml.tag!("cas:user", @user.email.to_s)
      xml.tag!("cas:attributes") do
      if @extra_attributes
          @extra_attributes.each do |key, value|
            namespace_aware_key = key[0..3]=='cas:' ? key : 'cas:' + key 
            serialize_extra_attribute(xml, namespace_aware_key, value)
          end
        end
      end
    end
  else
    xml.tag!("cas:authenticationFailure", {:code => @error}, @error)
  end
end

