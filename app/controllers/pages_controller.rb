class PagesController < ApplicationController
  def index
    @page = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new
    if @page.save
      flash[:notice] = "Page created successfully."
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.updated_attributes(subject_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(page_path(@page))
    else
      render('edit')
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page = Page.destroy
    flash[:notice] = "Page '#{@page}' deleted successfully."
    redirect_to(pages_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
