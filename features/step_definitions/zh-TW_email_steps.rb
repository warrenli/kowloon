那麼 %r{^"([^"]*?)" 應該收到 (\d+) 封電子郵件$} do |address, n|
  mailbox_for(address).size.should == n.to_i
end

當 %r{^"([^"]*?)" 閱讀標題為 "([^"]*?)" 的電子郵件$} do |address, subject|
  open_email(address, :with_subject => subject)
end

那麼 %r{^在電子郵件裡中應該寫着 "([^"]*?)"$} do |text|
  current_email.body.should =~ Regexp.new(text)
end

當 /^我去單擊電子郵件裡面的第一個網址$/ do
  click_first_link_in_email
end
