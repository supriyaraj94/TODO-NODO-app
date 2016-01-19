class UserMailer < ApplicationMailer
  default from: 'todo-nodo@app.com'
 
  def welcome_email(olditem)
    @item = olditem
    @user  = @item.list.user
    mail(to: "supriyaraj47@gmail.com", subject: 'An Item was removed')
  end  
end
