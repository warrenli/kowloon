功能: 登記成為網站會員
  為了能夠瀏覽那些只供註冊會員觀看的網頁內容
  作為一名訪客
  我要登記成為網站會員

  背景:
    假設 新登記的帳戶會自動生效

  場景: 用戶輸入了符合要求的帳戶名稱和電郵地址，便可登記為網站會員
    假設 我來到了登記版面
    當 我在"帳戶名稱"欄位中輸入"helloworld"
    而且 在"電郵地址"欄位中輸入"helloworld@example.com"
    而且 在"帳戶密碼"欄位中輸入"scretpassword"
    而且 在"確認密碼"欄位中輸入"scretpassword"
    而且 按下了"登記"按钮
    那麼 我應該看到"帳戶已成功登記"的提示信息
    而且 被引導到首頁

  場景大綱: 用戶輸入了並不符合要求的帳戶名稱、電郵地址、新密碼、確認新密碼，是不會成功登記為網站會員
    假設 我來到了登記版面
    當 我在"帳戶名稱"欄位中輸入"<帳戶名稱>"
    而且 在"電郵地址"欄位中輸入"<電郵地址>"
    而且 在"帳戶密碼"欄位中輸入"<新密碼>"
    而且 在"確認密碼"欄位中輸入"<確認新密碼>"
    而且 按下了"登記"按钮
    那麼 應該看到"無法被保存"的提示信息
    而且 停留在登記版面!

  例子:
    | 帳戶名稱 | 電郵地址 | 新密碼 | 確認新密碼 |
    | abc    | abc@example.com   | secretpassword | secretpassword |
    | abcd   | abcd@example.com  | secretpassword | secretpassword |
    | abcde  | abcde@example.com | secretpassword | secretpasswor2 |
    | abcde  | abcde@example.com | passwd         | passwd         |
    | abcde  | @example.com      | secretpassword | secretpassword |
    |        | abc@example.com   | secretpassword | secretpassword |
    | abc    |                   | secretpassword | secretpassword |
    | abcde  | abcde@example.com |                |                |
