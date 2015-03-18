class SectionsController < ApplicationController
  def show
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:id])
  end

  def new
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new
  end

  def create
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new(section_params)
    if @section.save
      redirect_to chapter_path(@section.chapter)
    else
      render :new
    end
  end

  def edit
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:id])
    old_title = @section.title
    if @section.update(section_params)
      redirect_to chapter_path(@section.chapter)
    else
      render :edit
    end
  end

  def destroy
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:id])
    destroyed_section_title = @section.title
    @section.destroy
    redirect_to chapter_path(@section.chapter)
  end

  private
    def section_params
      params.require(:section).permit(:title)
    end

end
