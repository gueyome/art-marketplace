class OrderMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'
 
    def order_done_email(order)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @order = order
      @user = order.user
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://monsite.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Récapitulatif de votre commande !') 
    end
end
