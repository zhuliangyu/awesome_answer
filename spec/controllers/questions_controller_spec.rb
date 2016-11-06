require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  describe "#create" do
    it "should insert into database if user sign in " do


      count_before=Question.count

      session[:user_id]=user.id


      post(:create, {question: FactoryGirl.attributes_for(:question)})


      count_after=Question.count


      expect(count_after).to(eq(count_before+1))


    end

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
