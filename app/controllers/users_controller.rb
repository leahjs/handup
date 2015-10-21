class UsersController < ApplicationController
  # def new
  # end

  def edit

  end

  def delete
  end

  def create
  end

  def update

    @user = User.find(params[:id])
    # binding.pry
    # spring = Date.new(params[:user]['spring_semester(1i)'].to_i,params[:user]['spring_semester(2i)'].to_i,params[:user]['spring_semester(3i)'].to_i)
    # fall = Date.new(params[:user]['fall_semester(1i)'].to_i,params[:user]['fall_semester(2i)'].to_i,params[:user]['fall_semester(3i)'].to_i)
    # @user.spring_semester = spring
    # @user.fall_semester = fall
    if @user.update(student_params)
      redirect_to user_path(@user)
    else
      redirect_to student_edit_path(@user)
    end
  end

  def show
    @user  = User.find(params[:id])
    @sponsored_students = @user.sponsored_students
    @sponsored_students = current_user.sponsored_students
    @student_sponsors = current_user.student_sponsors
    if current_user.status == 'sponsor'
      @set_challenges = current_user.challenged_students
    elsif current_user.status == 'student'
       @challenges = current_user.student_challenges
    end
  end

  def student_show
    @student = User.find(params[:id])
  end

  def status
    @user = User.find(params[:id])
  end

  def status_selected
    @user = User.find(params[:id])
    @user.update(status: status_params[:status])
    if @user.student?
      redirect_to student_edit_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  def student_edit
    @user = User.find(params[:id])
    @gender = ["Male", "Female", "Other"]
    @race = ["Caucasian", "African American", "Asian", "Indian", "Hispanic"]
  end


  def follow


    @user = User.find(params[:id])

    UserMailer.follow_email(current_user,@user).deliver_now
    # binding.pry
    # @user = User.create_and_send_email(student_params[:email])
    StudentSponsor.create(:student_id => params[:id], :sponsor_id => current_user.id)
    # flash[:notice] = "Following New Student"
    redirect_to user_path(current_user)
  end


  private

  def status_params
    params.require(:user).permit(:status)
  end


  def student_params
    params.require(:user).permit(:email, :school_name, :race, :major, :gpa, :location, :bio, :gender)
    # params.require(:current_user).permit(:follow_id, :current_id, :user_id, :sponsored)
  end




  def user_profile
    @user
  end
end
