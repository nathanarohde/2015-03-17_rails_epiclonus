class LessonsController <ApplicationController
  def new
    @section =  Section.find(params[:section_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = @section.lessons.new
  end

  def create
    @section = Section.find(params[:section_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      redirect_to chapter_section_lesson_path(@lesson.section.chapter)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = Lesson.find(params[:id])
    old_title = @lesson.title
    if @lesson.update(lesson_params)
      redirect_to section_path(@lesson.section)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = Lesson.find(params[:id])
    destroyed_lesson_title = @lesson.title
    @lesson.destroy
    redirect_to section_path(@lesson.section)
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title)
    params.require(:lesson).permit(:content)
  end
end
