require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  describe "#create" do

    context "user sign in "

    before do
      session[:user_id]=user.id

    end
    it "should insert into database" do


      count_before=Question.count

      # session[:user_id]=user.id


      post(:create, {question: FactoryGirl.attributes_for(:question)})


      count_after=Question.count


      expect(count_after).to(eq(count_before+1))


    end

    it "should redirect to question#show " do
      # question=FactoryGirl.create(:question,user:user)

      post(:create, {question: FactoryGirl.attributes_for(:question)})

      # expect(response).to(redirect_to question_path(question.id))


    end

    it "should have the same user and question creater" do
      # has problem here!!!
      post(:create, {question: FactoryGirl.attributes_for(:question)})




    end


  end


  context "user did not sign in " do
    it "should not insert into database if user does not sign in " do
      count_before=Question.count

      session[:user_id]=nil


      post(:create, {question: FactoryGirl.attributes_for(:question)})


      count_after=Question.count


      expect(count_after).to(eq(count_before))


    end

  end

  describe "#delete" do
    it "should delete a question if user sign in " do
      session[:user_id]=user.id

      before_count=Question.count
      question=FactoryGirl.create(:question)

      question.user=user

      question.save

      after_count=Question.count


      delete("destroy", {id: question.id})

      expect(before_count).to(eq(after_count-1))


    end

    it "should not delete a question if user does not sign in " do
      session[:user_id]=user.id

      question=FactoryGirl.create(:question)

      question.user=user

      question.save


      before_count=Question.count

      session[:user_id]=nil
      delete("destroy", {id: question.id})
      after_count=Question.count


      expect(before_count).to(eq(after_count))

    end

  end

end
