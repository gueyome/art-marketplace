class OrderMailer < ApplicationMailer
    default from: 'no-reply@production-art.herokuapp.com'
 
    def order_done_email(order)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @order = order
      @user = order.user
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://production-art.herokuapp.com/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: "Successful order dear #{@user.username} !") 
    end
end
