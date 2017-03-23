class SubjectsController < ApplicationController
  def index
    #find all subjects to list them using the scope we created earlier
    @subjects = Subject.sorted
  end

  def show
    #find a specific subject using it's db parameters
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(name: 'Default')
  end

  def create
    #1. Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #2. Save the object
    if @subject.save
    #3. If the save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)
    else
    #4. If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #1. Instantiate a new object using form parameters
    @subject = Subject.find(params[:id])
    #2. Save the object
    if @subject.update_attributes(subject_params)
    #3. If the save succeeds, redirect to the show action
      flash[:notice] = "Subject updated successfully."
      redirect_to(subject_path(@subject))
    else
    #4. If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' deleted successfully."
    redirect_to(subjects_path)
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
