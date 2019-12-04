class OrderMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'
 
    def order_done_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
      @order = order
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://monsite.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Votre commande a été effectuée !') 
    end
end
