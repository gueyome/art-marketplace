class ConversationsController < ApplicationController
  layout "artist_application"

  def index
    @last_messages = last_messages(correspondents_of(current_user))
  end

  def show
    @user1 = User.find(params[:user_id])
    @user2 = User.find(params[:id])
    @conversation = conversation_with(@user1, @user2)
  end


  private

  def conversation_with(user1, user2)
    sent_messages = user1.received_messages.where(sender_id: user2.id)
    received_messages = user2.received_messages.where(sender_id: user1.id)
    messages = sent_messages + received_messages
    return messages.sort_by { |mess| mess.created_at}
  end


  def correspondents_of(user)
    sent_messages = user.sent_messages
    received_messages = user.received_messages
    correspondents = []
    sent_messages.each { |message| correspondents << message.receiver}
    received_messages.each { |message| correspondents << message.sender}
    correspondents = correspondents.uniq
    return correspondents
  end

  def last_messages(correspondents)
    last_messages = []
    correspondents.each do |correspondent|
      messages = PrivateMessage.where(receiver_id: correspondent.id) + PrivateMessage.where(sender_id: correspondent.id)
      messages = messages.sort_by { |mess| mess.created_at}
      last_messages << messages.last
    end
    return last_messages
  end

end
